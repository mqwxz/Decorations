using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using LLC_Decoration.Classes;
using ООО__Украшение_.UI;

namespace LLC_Decoration

{
    public partial class frmAuth : Form
    {

        private string word = String.Empty;
        private int incorrectAnswer = 0;

        public frmAuth()
        {
            InitializeComponent();
            GetSettings();
            txtPassword.UseSystemPasswordChar = true;
        }

        private void chkPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (chkPassword.Checked )
            {
                txtPassword.UseSystemPasswordChar = false;
            }
            else
            {
                txtPassword.UseSystemPasswordChar = true;
            }
        }

        
        private void GetSettings()
        {
            //Получение сохранённых данных от учётной записи пользователя.
            txtLogin.Text = Properties.Settings.Default.login;
            txtPassword.Text = Properties.Settings.Default.password;
        }

        private void SaveSettings()
        {
            //Сохранение сохранённых данных от учётной записи пользователя.
            Properties.Settings.Default.login = txtLogin.Text;
            Properties.Settings.Default.password = txtPassword.Text;
            Properties.Settings.Default.Save();
        }

        private void chkRemember_CheckedChanged(object sender, EventArgs e)
        {
            SaveSettings();
            GetSettings();
        }

        private void btnAuth_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (String.IsNullOrEmpty(txtLogin.Text) || String.IsNullOrEmpty(txtPassword.Text))
            {
                MessageBox.Show("Заполните все поля!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            try
            {
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandText = "CheckCredentials"
                    };
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Connection = connectionString;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();

                        if (reader.HasRows)
                        {
                            User.UserID = reader.GetInt32(0);
                            User.UserSurname = reader.GetString(1);
                            User.UserName = reader.GetString(2);
                            User.UserPatronymic = reader.GetString(3);
                            User.UserRole = reader.GetInt32(6);

                            ShowProducts();
                        }
                        else
                        {
                            MessageBox.Show($"Неверное имя пользователя или пароль!",
                                    "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                            incorrectAnswer++;

                            if (incorrectAnswer > 0)
                            {
                                MessageBox.Show($"К сожалению, настало время капчи.", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                word = String.Empty;
                                LoadCaptcha();
                                txtCaptcha.Visible = true;
                                btnAnswer.Visible = true;
                                btnReset.Visible = true;
                                btnAuth.Enabled = false;
                            }
                        }
                        reader.Close();
                    }
                    connectionString.Close();
                    }
                }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void LoadCaptcha()
        {
            //Генерация капчи.
            picCaptcha.Visible = true;
            Random random = new Random();
            
            string chars = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
            for (int i = 0; i < 6; ++i)
                word += chars[random.Next(chars.Length)];

            var ing = new Bitmap(this.picCaptcha.Width, this.picCaptcha.Height);
            var font = new Font("Arial", 30, FontStyle.Italic, GraphicsUnit.Pixel);
            var graphics = Graphics.FromImage(ing);
            
            graphics.Clear(Color.White);
            graphics.DrawString(word.ToString(), font, Brushes.DarkGray, new Point(15, 35));
            graphics.DrawLine(Pens.Red, new Point(0, 0), new Point(Width - 5, Height - 1));
            graphics.DrawLine(Pens.Blue, new Point(0, 100), new Point(150, 0));
            graphics.DrawLine(Pens.Black, new Point(40, 1000), new Point(70, 0));

            picCaptcha.Image = ing;
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            word = String.Empty;
            LoadCaptcha();
        }

        private async void btnAnswer_Click(object sender, EventArgs e)
        {
            //Проверка ввода капчи и блокировка на 10 секунд в случае некорректного ввода ответа.
            if (txtCaptcha.Text == word.ToString())
            {
                MessageBox.Show($"Капча прошла проверку!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                btnAuth.Enabled = true;
            }
            else
            {
                MessageBox.Show($"Капча не прошла проверку!\nБлокировка возможности входа на 10 секунд.\n" +
                    $"Пожалуйста, подождите!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                btnAnswer.Enabled = false;
                btnAuth.Enabled = false;
                await Task.Delay(10000);
                btnAuth.Enabled = true;
                btnAnswer.Enabled = true;
            }
        }

        private void ShowProducts()
        {
            frmProducts product = new frmProducts();
            this.Hide();
            product.ShowDialog();
            this.Show();
        }

        private void btnGuest_Click(object sender, EventArgs e)
        {
            User.UserRole = 4;
            ShowProducts();
        }
    }
}
