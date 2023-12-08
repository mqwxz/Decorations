using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using LLC_Decoration.Classes;
using ООО__Украшение_.UI;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Tab;

namespace LLC_Decoration.UI
{
    public partial class frmOrders : Form
    {

        List<Order> showOrders;

        public frmOrders(List<Order> orders)
        {
            InitializeComponent();
            showOrders = orders;
            LoadDataToListBox();
            GetCost();
            ShowGreetings();
        }

        private void ShowGreetings()
        {
            if (User.UserRole == 4)
            {
                lblFIO.Text = "Добро пожаловать, Гость!";
            }
            else
            {
                lblFIO.Text = $"Добро пожаловать,\n{User.UserSurname} {User.UserName} {User.UserPatronymic}!";
            }
        }


        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cboPickUpPoints_Click(object sender, EventArgs e)
        {
            LoadPickUpPoints();
        }

        private void LoadPickUpPoints()
        {
            try
            {
                //Заполнение ComboBox данными с пунктами выдачи.
                using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    DataTable dt = new DataTable();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "GetPickUpPoints";
                    cmd.Connection = connectionString;
                    connectionString.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dt);
                    }

                    cboPickUpPoints.DataSource = dt;
                    cboPickUpPoints.DisplayMember = "Пункт выдачи";
                    cboPickUpPoints.ValueMember = "PickUpPointID";
                    connectionString.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void LoadDataToListBox()
        {
            try
            {
                //Заполнение ListBox данными о выбранных товаров пользователем.
                lstOrders.DataSource = showOrders;
                lstOrders.DisplayMember = "";
                lstOrders.DisplayMember = "Values";

                GetCost();

                //Если количество товаров = 0, то кнопка "Заказать" не будет доступна.
                if (lstOrders.Items.Count == 0)
                {
                    btnMakeOrder.Enabled = false;
                }
                else
                {
                    btnMakeOrder.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузить товары!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void удалитьТоварToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (lstOrders.Items.Count != 0)
            {
                int selectedIndex = lstOrders.SelectedIndex;
                showOrders.RemoveAt(selectedIndex);
            }
            LoadDataToListBox();
        }


        private void GetCost()
        {
            //Подсчёт суммы заказа, подсчёт скидки заказа.
            decimal finalSumWithDiscount = 0;
            int finalSumDiscountAmount = 0;

            foreach (Order order in showOrders)
            {
                finalSumWithDiscount += Convert.ToDecimal(order.ProductCostWithDiscount);
                finalSumDiscountAmount += Convert.ToInt32(order.ProductDiscountAmount);
            }
            lblCostWithDiscount.Text = $"{finalSumWithDiscount}";
            lblCostDiscounts.Text = $"{finalSumDiscountAmount}%";
        }

        private void lstOrders_MouseDown(object sender, MouseEventArgs e)
        {
            //Вызов ContextMenuStrip с помощью ПКМ по полю из ListBox для удаления товара из корзины.
            if (e.Button == MouseButtons.Right)
            {
                lstOrders.SelectedIndex = lstOrders.IndexFromPoint(e.Location);
                if (lstOrders.SelectedIndex != -1)
                {
                    cmsDel.Show();
                }
            }
        }

        private void lstOrders_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (lstOrders.SelectedItem != null)
                {
                    Order selectedOrder = (Order)lstOrders.SelectedItem;
                    string photoPath = selectedOrder.ProductPhoto;
                    picProduct.ImageLocation = photoPath;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось загрузить изображение!\n{ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void InsertQuery()
        {
            /*
             * Изменение количества товаров из склада в столбце "ProductQuantityInStock"
             * в зависимости от выбранного количества определённого товара по Артикулу.
            */
            var count =
                    from order in showOrders
                    group order by order.ProductArticleNumber into articles
                    select new
                    {
                        ProductArticleNumber = articles.Key,
                        Count = articles.Count(),
                    };

            DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            DateTime delivered = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            delivered = today.AddDays(6);
            int id;

            if (cboPickUpPoints.SelectedValue != null)
            {
                int pickUpPoint = (int)cboPickUpPoints.SelectedValue;


                if (MessageBox.Show("Вы точно уверены в своём выборе? ", "Сообщение",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
                    {
                        connectionString.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "GetCountArticles";
                        cmd.Connection = connectionString;

                        foreach (var items in count)
                        {
                            cmd.Parameters.AddWithValue("@countArticles", items.Count);
                            cmd.Parameters.AddWithValue("@ProductArticleNumber", items.ProductArticleNumber);
                            cmd.ExecuteNonQuery();
                        }

                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.CommandText = "InsertOrder";
                        cmd1.Connection = connectionString;

                        cmd1.Parameters.AddWithValue("@OrderDate", today);
                        cmd1.Parameters.AddWithValue("@OrderDeliveryDate", delivered);
                        cmd1.Parameters.AddWithValue("@OrderPickupPoint", pickUpPoint);

                        if (User.UserRole == 4)
                        {
                            cmd1.Parameters.AddWithValue("@OrderClient", DBNull.Value);
                        }
                        else
                        {
                            cmd1.Parameters.AddWithValue("@OrderClient", User.UserID);
                        }
                        id = (int)cmd1.ExecuteScalar();


                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.CommandText = "InsertOrderProduct";
                        cmd2.Connection = connectionString;

                        foreach (var items in count)
                        {
                            cmd2.Parameters.AddWithValue("@OrderId", id);
                            cmd2.Parameters.AddWithValue("@ProductArticleNumber", items.ProductArticleNumber);
                            cmd2.Parameters.AddWithValue("@OrderQuantity", items.Count);

                            cmd2.ExecuteNonQuery();
                        }
                        connectionString.Close();
                    }
                    MessageBox.Show($"Ваш заказ принят!\nОжидайте доставку.", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Для начала выберите пункт выдачи!", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnMakeOrder_Click(object sender, EventArgs e)
        {
            InsertQuery();
        }
    }
}

