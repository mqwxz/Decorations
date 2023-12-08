using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using LLC_Decoration.Classes;
using LLC_Decoration.UI;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace ООО__Украшение_.UI
{
    public partial class frmProducts : Form
    {

        List<Order> showOrders;

        public frmProducts()
        {
            InitializeComponent();
            ShowFunctionality();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void ShowFunctionality()
        {
            //Отображение данных и возможностей в зависимости от роли пользователя.
            switch (User.UserRole)
            {
                case 1:
                    lblFIO.Text = $"Добро пожаловать,\n{User.UserSurname} {User.UserName} {User.UserPatronymic}!";
                    break;
                case 2:
                    lblFIO.Text = $"Добро пожаловать,\n{User.UserSurname} {User.UserName} {User.UserPatronymic}!";
                    btnWork.Visible = true;
                    break;
                case 3:
                    lblFIO.Text = $"Добро пожаловать,\n{User.UserSurname} {User.UserName} {User.UserPatronymic}!";
                    btnWork.Visible = true;
                    break;
                case 4:
                    lblFIO.Text = "Добро пожаловать, Гость!";
                    break;
            }
        }

        private void ShowProducts()
        {
            using (SqlConnection connectionString = new SqlConnection(LLC_Decoration.Properties.Settings.Default.connectionString))
            {
                try
                {
                    int selectedDiscount = cboSortingDiscount.SelectedIndex;
                    DataTable dt = new DataTable();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = connectionString;
                    connectionString.Open();

                    switch (selectedDiscount)
                    {
                        //Фильтрация товаров по скидке из пункта "Все диапозоны".
                        case 0:
                            cmd.CommandText = "GetAllDiscounts";
                            break;
                        //Фильтрация товаров по скидке из пункта "0-9,99%".
                        case 1:
                            cmd.CommandText = "GetDiscountBeforeNine";
                            break;
                        //Фильтрация товаров по скидке из пункта "10 - 14,99%".
                        case 2:
                            cmd.CommandText = "GetDiscountBeforeFourteen";
                            break;
                        //Фильтрация товаров по скидке из пункта "15 % и более".
                        case 3:
                            cmd.CommandText = "GetDiscountMoreFifteen";
                            break;
                    }
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader);
                    }
                    dgvProducts.DataSource = dt;

                    //Изменение цвета полей в DataGridView в случае действ. скидки > 15%
                    foreach (DataGridViewRow row in dgvProducts.Rows)
                    {
                        if (Convert.ToInt32(row.Cells[8].Value) > 15)
                        {
                            row.DefaultCellStyle.BackColor = Color.Chartreuse;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Произошёл сбой!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                connectionString.Close();
                lblCount.Text = $"Количество товаров: {dgvProducts.RowCount} из {dgvProducts.RowCount}";
            }
        }

        private void cboSortingDiscount_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowProducts();
        }

        private void dgvProducts_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                lblProductName.Text = dgvProducts.CurrentRow.Cells[1].Value.ToString();
                lblProductDescription.Text = dgvProducts.CurrentRow.Cells[10].Value.ToString();
                lblProductManufacturer.Text = dgvProducts.CurrentRow.Cells[5].Value.ToString();
                lblCost.Text = dgvProducts.CurrentRow.Cells[3].Value.ToString();
                lblCostWithDiscount.Text = dgvProducts.CurrentRow.Cells[11].Value.ToString();

                /*
                 * Если у товара снижена стоимость, то основная цена должна быть перечеркнута.
                 * Рядом с ней будет указана итоговая стоимость.
                */

                if (lblCost.Text != lblCostWithDiscount.Text)
                {
                    lblCost.Font = new Font(lblCost.Font, FontStyle.Strikeout);
                }
                else
                {
                    lblCost.Font = new Font(lblCost.Font, FontStyle.Regular);
                }

                /*
                 * Отображение фотографий продуктов с помощью ЛКМ из ресурсов проекта.
                 * При отсутствии изображения выводится картинка-заглушка из ресурсов проекта.
                */

                string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
                string productPhoto = dgvProducts.CurrentRow.Cells[0].Value.ToString();
                string photoPath = Path.Combine(projectDirectory, $"Resources\\Images\\Products\\{productPhoto}.jpg");

                if (File.Exists(photoPath))
                {
                    picProduct.ImageLocation = Path.Combine(projectDirectory, $"Resources\\Images\\Products\\{productPhoto}.jpg");
                }
                else
                {
                    try
                    {
                        picProduct.ImageLocation = Path.Combine(projectDirectory, $"Resources\\Images\\Icons and Logos\\picture.png");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Произошёл сбой!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }

                lblDiscount.Text = dgvProducts.CurrentRow.Cells[8].Value.ToString();

                //Изменение фонового цвета Label со скидкой, если она превышает 15%.
                if (Convert.ToInt16(lblDiscount.Text) >= 15)
                {
                    lblDiscount.BackColor = Color.Chartreuse;
                }
                else
                {
                    lblDiscount.BackColor = Color.FromArgb(255, 204, 153);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошёл сбой!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void FilterName()
        {
            //Поиск товаров по наименованию.
            BindingSource bs = new BindingSource
            {
                DataSource = dgvProducts.DataSource,
                Filter = "Наименование" + " like '%" + txtSearchProduct.Text + "%'"
            };
            dgvProducts.DataSource = bs;

            lblCount.Text = $"Количество товаров: {dgvProducts.RowCount} из {dgvProducts.RowCount}";
        }

        private void txtSearchProduct_TextChanged(object sender, EventArgs e)
        {
            FilterName();
        }

        private void cboSortingPrice_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Сортировка товаров (по возрастанию и убыванию) по стоимости.
                if (cboSortingPrice.SelectedIndex == 0)
                {
                    dgvProducts.Sort(dgvProducts.Columns[3], ListSortDirection.Ascending);
                }
                else
                {
                    dgvProducts.Sort(dgvProducts.Columns[3], ListSortDirection.Descending);
                }
            }
            catch
            {
                MessageBox.Show("Для начала выберите диапозон по размеру скидок!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dgvProducts_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int currentRow = e.RowIndex;

            //Вызов ContextMenuStrip с помощью ПКМ по полю из DataGridView для добавления товара в корзину.
            if (e.Button == MouseButtons.Right)
            {
                if (currentRow >= 0)
                {
                    dgvProducts.Rows[currentRow].Selected = true;
                    Point point = dgvProducts.PointToClient(Cursor.Position);
                    cmsAdd.Show(dgvProducts, point);
                }
            }
        }

        private void добавитьКЗакToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string quantityInStock = dgvProducts.CurrentRow.Cells[9].Value.ToString();
            string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
            string productPhoto = dgvProducts.CurrentRow.Cells[0].Value.ToString();
            string photoPath = Path.Combine(projectDirectory, $"Resources\\Images\\Products\\{productPhoto}.jpg");

            //Проверка наличия товара на складе. Если товара нет на складе, то его нельзя выбрать.
            if(quantityInStock != "0")
            {
                btnShowOrder.Visible = true;
                //Добавление заказа в коллекцию Order.
                try
                {
                    if (!File.Exists(photoPath))
                    {
                        photoPath = Path.Combine(projectDirectory, $"Resources\\Images\\Icons and Logos\\picture.png");
                    }

                    Order order = new Order
                    {
                        ProductArticleNumber = dgvProducts.CurrentRow.Cells[0].Value.ToString(),
                        ProductName = dgvProducts.CurrentRow.Cells[1].Value.ToString(),
                        ProductCost = dgvProducts.CurrentRow.Cells[3].Value.ToString(),
                        ProductManufacturer = dgvProducts.CurrentRow.Cells[5].Value.ToString(),
                        ProductCategory = dgvProducts.CurrentRow.Cells[7].Value.ToString(),
                        ProductDiscountAmount = dgvProducts.CurrentRow.Cells[8].Value.ToString(),
                        ProductDescription = dgvProducts.CurrentRow.Cells[10].Value.ToString(),
                        ProductCostWithDiscount = dgvProducts.CurrentRow.Cells[11].Value.ToString(),
                        ProductPhoto = photoPath
                    };

                    if (showOrders == null)
                    {
                        showOrders = new List<Order>();
                    }

                    showOrders.Add(order);
                }

                catch (Exception ex)
                {
                    MessageBox.Show($"Произошёл сбой!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Товара нет в наличии!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btnShowOrder_Click(object sender, EventArgs e)
        {
            using (var frm = new frmOrders(showOrders))
            {
                this.Hide();
                frm.ShowDialog();
                this.Show();
            }
            
            //Если корзина вновь окажется пустой, то доступ к просмотрю заказа будет закрыт.
            if (showOrders.Count == 0)
            {
                btnShowOrder.Visible = false;
            }
        }

        private void btnWork_Click(object sender, EventArgs e)
        {
            frmWork frmWork = new frmWork();
            this.Hide();
            frmWork.ShowDialog();
            this.Show();
        }
    }   
}
