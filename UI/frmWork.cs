using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LLC_Decoration.UI
{
    public partial class frmWork : Form
    {
        public frmWork()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void ShowOrdersMA()
        {
            using (SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.connectionString))
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
                        //Фильтрация заказов по суммарной скидке из пункта "Все диапозоны".
                        case 0:
                            cmd.CommandText = "GetAllOrders";
                            break;
                        //Фильтрация заказов по суммарной скидке из пункта "0-10%".
                        case 1:
                            cmd.CommandText = "GetOrdersBeforeTen";
                            break;
                        //Фильтрация заказов по суммарной скидке из пункта "11-14%".
                        case 2:
                            cmd.CommandText = "GetOrdersBeforeFourteen";
                            break;
                        //Фильтрация заказов по суммарной скидке из пункта "15 % и более".
                        case 3:
                            cmd.CommandText = "GetOrdersMoreFifteen";
                            break;
                    }
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader);
                    }
                    dgvOrdersMA.DataSource = dt;

                    //Если все товары в заказе есть на складе в наличии более 3 позиций, то строка с заказом должна быть выделена цветом.
                    foreach (DataGridViewRow row in dgvOrdersMA.Rows)
                    {
                        if (Convert.ToInt32(row.Cells[6].Value) > 3)
                        {
                            row.DefaultCellStyle.BackColor = Color.FromArgb(32, 178, 170);
                        }

                        //Если хотя бы одного товара нет на складе, то строка должна быть выделена цветом.
                        if(Convert.ToInt32(row.Cells[6].Value) <= 0)
                        {
                            row.DefaultCellStyle.BackColor = Color.FromArgb(255, 140, 0);
                        }
                    }
                }
                
                /*
                 * Catch пустой, т.к. постоянно вылазит ошибка с (DBNull). 
                 * Возможно это связано с ФИО, т.к. они не могут быть NULL или другие поля.
                */

                catch
                {

                }
                connectionString.Close();
            }
        }

        private void cboSortingDiscount_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowOrdersMA();
        }

        private void cboSortingPrice_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Сортировка заказов (по возрастанию и убыванию) по суммарной стоимости.
                if (cboSortingPrice.SelectedIndex == 0)
                {
                    dgvOrdersMA.Sort(dgvOrdersMA.Columns[3], ListSortDirection.Ascending);
                }
                else
                {
                    dgvOrdersMA.Sort(dgvOrdersMA.Columns[9], ListSortDirection.Descending);
                }
            }
            catch
            {
                MessageBox.Show("Для начала выберите диапозон по размеру суммарной скидки!", 
                    "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
