using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LLC_Decoration.Classes
{
    public class Order
    {
        //public Order() { }
        public string ProductArticleNumber { get; set; }
        public string ProductName { get; set; }
        public string ProductCost { get; set; }
        public string ProductManufacturer { get; set; }
        public string ProductCategory { get; set; }
        public string ProductDiscountAmount { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCostWithDiscount { get; set; }
        public string ProductPhoto { get; set; }
        public static string OrderDate { get; set; }

        public string Values => $"{ProductArticleNumber} | Товар: {ProductName} | Производитель: {ProductManufacturer} | Категория: {ProductCategory} " +
            $"| Скидка: {ProductDiscountAmount}% | Итоговая стоимость: {ProductCostWithDiscount}";
    }
}
