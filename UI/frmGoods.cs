using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LLC_Decoration.UI
{
    public partial class frmGoods : Form
    {
        public frmGoods()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtArticle.Text) && String.IsNullOrEmpty(txtCategory.Text) && String.IsNullOrEmpty(txtCost.Text) &&
                String.IsNullOrEmpty(txtDescription.Text) && String.IsNullOrEmpty(txtDiscountAmount.Text) && String.IsNullOrEmpty(txtManufacturer.Text)
                && String.IsNullOrEmpty(txtMaxDiscount.Text) && String.IsNullOrEmpty(txtName.Text) && String.IsNullOrEmpty(txtQuantity.Text)
                && String.IsNullOrEmpty(txtSupplier.Text) && String.IsNullOrEmpty(txtUnit.Text))
            {
                MessageBox.Show("Заполните все поля!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                try
                {
                    using (SqlConnection connectionString = new SqlConnection(LLC_Decoration.Properties.Settings.Default.connectionString))
                    {
                        connectionString.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "InsertProduct";
                        cmd.Connection = connectionString;
                        cmd.Parameters.AddWithValue("@ProductArticleNumber", txtArticle.Text.ToString());
                        cmd.Parameters.AddWithValue("@ProductName", txtName.Text.ToString());
                        cmd.Parameters.AddWithValue("@ProductUnitOfMeasurement", txtUnit.Text.ToString());
                        cmd.Parameters.AddWithValue("@ProductCost", Convert.ToDecimal(txtCost.Text.ToString()));
                        cmd.Parameters.AddWithValue("@ProductMaxDiscountAmount", Convert.ToInt32(txtMaxDiscount.Text.ToString()));
                        cmd.Parameters.AddWithValue("@ProductManufacturer", txtManufacturer.Text.ToString());
                        cmd.Parameters.AddWithValue("@ProductSupplier", txtSupplier.Text.ToString());
                        cmd.Parameters.AddWithValue("@ProductCategory", txtCategory.Text.ToString());
                        cmd.Parameters.AddWithValue("@ProductDiscountAmount", Convert.ToInt32(txtDiscountAmount.Text.ToString()));
                        cmd.Parameters.AddWithValue("@ProductQuantityInStock", Convert.ToInt32(txtQuantity.Text.ToString()));
                        cmd.Parameters.AddWithValue("@ProductDescription", txtDescription.Text.ToString());
                        cmd.ExecuteNonQuery();
                        connectionString.Close();

                    }
                    MessageBox.Show($"Товар был успешно добавление!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btnPhoto.Visible = true;
                    btnSavePhoto.Visible = true;
                }
                catch
                {
                    MessageBox.Show($"Возможно товар с таким артиклем уже существует!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }   

        private void btnPhoto_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog ofd = new OpenFileDialog();
                ofd.InitialDirectory = "C:\\";
                ofd.Filter = "Image Files (*.bmp;*.jpg;*.jpeg,*.png)|*.BMP;*.JPG;*.JPEG;*.PNG";
                ofd.FilterIndex = 2;
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    picProduct.Image = Image.FromFile(ofd.FileName);
                    lblPath.Text = ofd.SafeFileName.ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошёл сбой!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }   
        }

        private void btnSavePhoto_Click(object sender, EventArgs e)
        {
            if (picProduct.Image != null)
            {
                MemoryStream memoryStream = new MemoryStream();
                picProduct.Image.Save(memoryStream, picProduct.Image.RawFormat);
                byte[] a = memoryStream.GetBuffer();
                memoryStream.Close();
                using (SqlConnection connectionString = new SqlConnection(LLC_Decoration.Properties.Settings.Default.connectionString))
                {
                    connectionString.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "InsertPhoto";
                    cmd.Connection = connectionString;
                    cmd.Parameters.AddWithValue("@ProductPhoto", lblPath.Text);
                    cmd.Parameters.AddWithValue("@ProductArticleNumber", txtArticle.Text.ToString());
                    cmd.ExecuteNonQuery();
                    connectionString.Close();
                    lblPath.Text = "";
                    picProduct.Image = null;
                    Clear();
                }
                MessageBox.Show($"Фото товара было успешно обновлено!", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void Clear()
        {
            txtArticle.Clear();
            txtName.Clear();
            txtCost.Clear();
            txtManufacturer.Clear();
            txtDescription.Clear();
            txtCategory.Clear();
            txtDiscountAmount.Clear();
            txtMaxDiscount.Clear();
            txtSupplier.Clear();
            txtUnit.Clear();
            txtQuantity.Clear();
        }
    }
}
