﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using LLC_Decoration.Classes;
using ООО__Украшение_.UI;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

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
            double finalSumWithDiscount = 0;
            int finalSumDiscountAmount = 0;

            foreach (Order order in showOrders)
            {
                finalSumWithDiscount += Convert.ToDouble(order.ProductCostWithDiscount);
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
    }
}
