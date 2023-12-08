using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
            
        }
    }
}
