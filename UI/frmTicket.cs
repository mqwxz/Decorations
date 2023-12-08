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
using LLC_Decoration.Classes;

namespace LLC_Decoration.UI
{
    public partial class frmTicket : Form
    {

        List<Order> showOrders;

        public frmTicket(List<Order> orders)
        {
            InitializeComponent();
            showOrders = orders;
            LoadDataToListBox();
            GetCost();
        }

        private void LoadDataToListBox()
        {
            lstTicket.DisplayMember = "Values";
            lstTicket.DataSource = showOrders;
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
            lblCostWithDiscount.Text = $"Сумма заказа: {finalSumWithDiscount}";
            lblCostDiscounts.Text = $"Сумма скидки: {finalSumDiscountAmount}%";

            lblPickUpPoint.Text = $"Пункт выдачи: {Order.OrderDate}";
        }
    }
}
