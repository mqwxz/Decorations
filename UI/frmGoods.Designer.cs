namespace LLC_Decoration.UI
{
    partial class frmGoods
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmGoods));
            this.pnlUp = new System.Windows.Forms.Panel();
            this.lblArticle = new System.Windows.Forms.Label();
            this.pnlDown = new System.Windows.Forms.Panel();
            this.pnlLogo = new System.Windows.Forms.Panel();
            this.picLogo = new System.Windows.Forms.PictureBox();
            this.pnlDiscount = new System.Windows.Forms.Panel();
            this.btnAddProduct = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.pnlPhotoProduct = new System.Windows.Forms.Panel();
            this.txtArticle = new System.Windows.Forms.TextBox();
            this.lblName = new System.Windows.Forms.Label();
            this.txtName = new System.Windows.Forms.TextBox();
            this.txtUnit = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtCost = new System.Windows.Forms.TextBox();
            this.lblCost = new System.Windows.Forms.Label();
            this.txtMaxDiscount = new System.Windows.Forms.TextBox();
            this.lblMaxDiscount = new System.Windows.Forms.Label();
            this.txtManufacturer = new System.Windows.Forms.TextBox();
            this.lblManufacturer = new System.Windows.Forms.Label();
            this.txtSupplier = new System.Windows.Forms.TextBox();
            this.lblSupplier = new System.Windows.Forms.Label();
            this.txtCategory = new System.Windows.Forms.TextBox();
            this.lblCategory = new System.Windows.Forms.Label();
            this.txtDiscountAmount = new System.Windows.Forms.TextBox();
            this.lblDiscountAmount = new System.Windows.Forms.Label();
            this.txtQuantity = new System.Windows.Forms.TextBox();
            this.lblQuantity = new System.Windows.Forms.Label();
            this.txtDescription = new System.Windows.Forms.TextBox();
            this.lblDescription = new System.Windows.Forms.Label();
            this.txtWithDiscount = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnCostWithDiscount = new System.Windows.Forms.Button();
            this.picProduct = new System.Windows.Forms.PictureBox();
            this.button2 = new System.Windows.Forms.Button();
            this.pnlDown.SuspendLayout();
            this.pnlLogo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).BeginInit();
            this.pnlDiscount.SuspendLayout();
            this.pnlPhotoProduct.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picProduct)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlUp
            // 
            this.pnlUp.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(204)))), ((int)(((byte)(153)))));
            this.pnlUp.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlUp.Location = new System.Drawing.Point(0, 0);
            this.pnlUp.Name = "pnlUp";
            this.pnlUp.Size = new System.Drawing.Size(812, 135);
            this.pnlUp.TabIndex = 1;
            // 
            // lblArticle
            // 
            this.lblArticle.AutoSize = true;
            this.lblArticle.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblArticle.Location = new System.Drawing.Point(196, 150);
            this.lblArticle.Name = "lblArticle";
            this.lblArticle.Size = new System.Drawing.Size(72, 23);
            this.lblArticle.TabIndex = 0;
            this.lblArticle.Text = "Артикл ";
            // 
            // pnlDown
            // 
            this.pnlDown.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(204)))), ((int)(((byte)(153)))));
            this.pnlDown.Controls.Add(this.pnlLogo);
            this.pnlDown.Controls.Add(this.pnlDiscount);
            this.pnlDown.Controls.Add(this.pnlPhotoProduct);
            this.pnlDown.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.pnlDown.Location = new System.Drawing.Point(0, 423);
            this.pnlDown.Name = "pnlDown";
            this.pnlDown.Size = new System.Drawing.Size(812, 135);
            this.pnlDown.TabIndex = 3;
            // 
            // pnlLogo
            // 
            this.pnlLogo.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlLogo.Controls.Add(this.picLogo);
            this.pnlLogo.Location = new System.Drawing.Point(3, 3);
            this.pnlLogo.Name = "pnlLogo";
            this.pnlLogo.Size = new System.Drawing.Size(177, 129);
            this.pnlLogo.TabIndex = 2;
            // 
            // picLogo
            // 
            this.picLogo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.picLogo.Image = ((System.Drawing.Image)(resources.GetObject("picLogo.Image")));
            this.picLogo.Location = new System.Drawing.Point(3, 3);
            this.picLogo.Name = "picLogo";
            this.picLogo.Size = new System.Drawing.Size(167, 119);
            this.picLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picLogo.TabIndex = 1;
            this.picLogo.TabStop = false;
            // 
            // pnlDiscount
            // 
            this.pnlDiscount.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlDiscount.Controls.Add(this.button2);
            this.pnlDiscount.Controls.Add(this.btnCostWithDiscount);
            this.pnlDiscount.Controls.Add(this.btnAddProduct);
            this.pnlDiscount.Controls.Add(this.btnClose);
            this.pnlDiscount.Location = new System.Drawing.Point(359, 3);
            this.pnlDiscount.Name = "pnlDiscount";
            this.pnlDiscount.Size = new System.Drawing.Size(450, 129);
            this.pnlDiscount.TabIndex = 12;
            // 
            // btnAddProduct
            // 
            this.btnAddProduct.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnAddProduct.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddProduct.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnAddProduct.Location = new System.Drawing.Point(3, 81);
            this.btnAddProduct.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.btnAddProduct.Name = "btnAddProduct";
            this.btnAddProduct.Size = new System.Drawing.Size(340, 41);
            this.btnAddProduct.TabIndex = 17;
            this.btnAddProduct.Text = "Добавить товар";
            this.btnAddProduct.UseVisualStyleBackColor = false;
            this.btnAddProduct.Click += new System.EventHandler(this.btnAddProduct_Click);
            // 
            // btnClose
            // 
            this.btnClose.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnClose.Location = new System.Drawing.Point(346, 81);
            this.btnClose.Margin = new System.Windows.Forms.Padding(0, 1, 3, 3);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(97, 41);
            this.btnClose.TabIndex = 15;
            this.btnClose.Text = "Выход";
            this.btnClose.UseVisualStyleBackColor = false;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // pnlPhotoProduct
            // 
            this.pnlPhotoProduct.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlPhotoProduct.Controls.Add(this.picProduct);
            this.pnlPhotoProduct.Location = new System.Drawing.Point(186, 3);
            this.pnlPhotoProduct.Name = "pnlPhotoProduct";
            this.pnlPhotoProduct.Size = new System.Drawing.Size(167, 129);
            this.pnlPhotoProduct.TabIndex = 0;
            // 
            // txtArticle
            // 
            this.txtArticle.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtArticle.Location = new System.Drawing.Point(8, 147);
            this.txtArticle.Name = "txtArticle";
            this.txtArticle.Size = new System.Drawing.Size(182, 30);
            this.txtArticle.TabIndex = 1;
            this.txtArticle.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblName.Location = new System.Drawing.Point(196, 185);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(121, 23);
            this.lblName.TabIndex = 4;
            this.lblName.Text = "Наименование";
            // 
            // txtName
            // 
            this.txtName.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtName.Location = new System.Drawing.Point(8, 182);
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(182, 30);
            this.txtName.TabIndex = 5;
            this.txtName.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtUnit
            // 
            this.txtUnit.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtUnit.Location = new System.Drawing.Point(8, 218);
            this.txtUnit.Name = "txtUnit";
            this.txtUnit.ReadOnly = true;
            this.txtUnit.Size = new System.Drawing.Size(182, 30);
            this.txtUnit.TabIndex = 7;
            this.txtUnit.Text = "шт.";
            this.txtUnit.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.label1.Location = new System.Drawing.Point(196, 221);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(119, 23);
            this.label1.TabIndex = 6;
            this.label1.Text = "Ед. измерения";
            // 
            // txtCost
            // 
            this.txtCost.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtCost.Location = new System.Drawing.Point(8, 254);
            this.txtCost.Name = "txtCost";
            this.txtCost.Size = new System.Drawing.Size(182, 30);
            this.txtCost.TabIndex = 9;
            this.txtCost.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblCost
            // 
            this.lblCost.AutoSize = true;
            this.lblCost.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblCost.Location = new System.Drawing.Point(196, 257);
            this.lblCost.Name = "lblCost";
            this.lblCost.Size = new System.Drawing.Size(147, 23);
            this.lblCost.TabIndex = 8;
            this.lblCost.Text = "Стоимость товара";
            // 
            // txtMaxDiscount
            // 
            this.txtMaxDiscount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtMaxDiscount.Location = new System.Drawing.Point(8, 290);
            this.txtMaxDiscount.Name = "txtMaxDiscount";
            this.txtMaxDiscount.Size = new System.Drawing.Size(182, 30);
            this.txtMaxDiscount.TabIndex = 11;
            this.txtMaxDiscount.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblMaxDiscount
            // 
            this.lblMaxDiscount.AutoSize = true;
            this.lblMaxDiscount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblMaxDiscount.Location = new System.Drawing.Point(196, 293);
            this.lblMaxDiscount.Name = "lblMaxDiscount";
            this.lblMaxDiscount.Size = new System.Drawing.Size(169, 23);
            this.lblMaxDiscount.TabIndex = 10;
            this.lblMaxDiscount.Text = "Макс. размер скидки";
            // 
            // txtManufacturer
            // 
            this.txtManufacturer.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtManufacturer.Location = new System.Drawing.Point(8, 326);
            this.txtManufacturer.Name = "txtManufacturer";
            this.txtManufacturer.Size = new System.Drawing.Size(182, 30);
            this.txtManufacturer.TabIndex = 13;
            this.txtManufacturer.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblManufacturer
            // 
            this.lblManufacturer.AutoSize = true;
            this.lblManufacturer.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblManufacturer.Location = new System.Drawing.Point(196, 329);
            this.lblManufacturer.Name = "lblManufacturer";
            this.lblManufacturer.Size = new System.Drawing.Size(130, 23);
            this.lblManufacturer.TabIndex = 12;
            this.lblManufacturer.Text = "Производитель";
            // 
            // txtSupplier
            // 
            this.txtSupplier.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtSupplier.Location = new System.Drawing.Point(8, 362);
            this.txtSupplier.Name = "txtSupplier";
            this.txtSupplier.Size = new System.Drawing.Size(182, 30);
            this.txtSupplier.TabIndex = 15;
            this.txtSupplier.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblSupplier
            // 
            this.lblSupplier.AutoSize = true;
            this.lblSupplier.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblSupplier.Location = new System.Drawing.Point(196, 365);
            this.lblSupplier.Name = "lblSupplier";
            this.lblSupplier.Size = new System.Drawing.Size(97, 23);
            this.lblSupplier.TabIndex = 14;
            this.lblSupplier.Text = "Поставщик";
            // 
            // txtCategory
            // 
            this.txtCategory.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtCategory.Location = new System.Drawing.Point(407, 147);
            this.txtCategory.Name = "txtCategory";
            this.txtCategory.Size = new System.Drawing.Size(182, 30);
            this.txtCategory.TabIndex = 17;
            this.txtCategory.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblCategory
            // 
            this.lblCategory.AutoSize = true;
            this.lblCategory.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblCategory.Location = new System.Drawing.Point(595, 150);
            this.lblCategory.Name = "lblCategory";
            this.lblCategory.Size = new System.Drawing.Size(88, 23);
            this.lblCategory.TabIndex = 16;
            this.lblCategory.Text = "Категория";
            // 
            // txtDiscountAmount
            // 
            this.txtDiscountAmount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtDiscountAmount.Location = new System.Drawing.Point(407, 182);
            this.txtDiscountAmount.Name = "txtDiscountAmount";
            this.txtDiscountAmount.Size = new System.Drawing.Size(182, 30);
            this.txtDiscountAmount.TabIndex = 19;
            this.txtDiscountAmount.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblDiscountAmount
            // 
            this.lblDiscountAmount.AutoSize = true;
            this.lblDiscountAmount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblDiscountAmount.Location = new System.Drawing.Point(595, 185);
            this.lblDiscountAmount.Name = "lblDiscountAmount";
            this.lblDiscountAmount.Size = new System.Drawing.Size(124, 23);
            this.lblDiscountAmount.TabIndex = 18;
            this.lblDiscountAmount.Text = "Действ. скидка";
            // 
            // txtQuantity
            // 
            this.txtQuantity.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtQuantity.Location = new System.Drawing.Point(407, 218);
            this.txtQuantity.Name = "txtQuantity";
            this.txtQuantity.Size = new System.Drawing.Size(182, 30);
            this.txtQuantity.TabIndex = 21;
            this.txtQuantity.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblQuantity
            // 
            this.lblQuantity.AutoSize = true;
            this.lblQuantity.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblQuantity.Location = new System.Drawing.Point(595, 221);
            this.lblQuantity.Name = "lblQuantity";
            this.lblQuantity.Size = new System.Drawing.Size(141, 23);
            this.lblQuantity.TabIndex = 20;
            this.lblQuantity.Text = "Кол-во на складе";
            // 
            // txtDescription
            // 
            this.txtDescription.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtDescription.Location = new System.Drawing.Point(407, 257);
            this.txtDescription.Multiline = true;
            this.txtDescription.Name = "txtDescription";
            this.txtDescription.Size = new System.Drawing.Size(182, 99);
            this.txtDescription.TabIndex = 23;
            this.txtDescription.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblDescription
            // 
            this.lblDescription.AutoSize = true;
            this.lblDescription.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblDescription.Location = new System.Drawing.Point(595, 257);
            this.lblDescription.Name = "lblDescription";
            this.lblDescription.Size = new System.Drawing.Size(86, 23);
            this.lblDescription.TabIndex = 22;
            this.lblDescription.Text = "Описание";
            // 
            // txtWithDiscount
            // 
            this.txtWithDiscount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.txtWithDiscount.Location = new System.Drawing.Point(407, 362);
            this.txtWithDiscount.Name = "txtWithDiscount";
            this.txtWithDiscount.Size = new System.Drawing.Size(182, 30);
            this.txtWithDiscount.TabIndex = 25;
            this.txtWithDiscount.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.label2.Location = new System.Drawing.Point(595, 365);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(181, 23);
            this.label2.TabIndex = 24;
            this.label2.Text = "Стоимость со скидкой";
            // 
            // btnCostWithDiscount
            // 
            this.btnCostWithDiscount.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnCostWithDiscount.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCostWithDiscount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnCostWithDiscount.Location = new System.Drawing.Point(3, 38);
            this.btnCostWithDiscount.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.btnCostWithDiscount.Name = "btnCostWithDiscount";
            this.btnCostWithDiscount.Size = new System.Drawing.Size(440, 41);
            this.btnCostWithDiscount.TabIndex = 18;
            this.btnCostWithDiscount.Text = "Подсчитать стоимость со скидкой";
            this.btnCostWithDiscount.UseVisualStyleBackColor = false;
            this.btnCostWithDiscount.Click += new System.EventHandler(this.btnCostWithDiscount_Click);
            // 
            // picProduct
            // 
            this.picProduct.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.picProduct.Image = ((System.Drawing.Image)(resources.GetObject("picProduct.Image")));
            this.picProduct.Location = new System.Drawing.Point(3, 3);
            this.picProduct.Name = "picProduct";
            this.picProduct.Size = new System.Drawing.Size(157, 119);
            this.picProduct.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picProduct.TabIndex = 5;
            this.picProduct.TabStop = false;
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.button2.Location = new System.Drawing.Point(3, 1);
            this.button2.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(440, 36);
            this.button2.TabIndex = 20;
            this.button2.Text = "Добавить фотографию";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // frmGoods
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(812, 558);
            this.Controls.Add(this.txtWithDiscount);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtDescription);
            this.Controls.Add(this.lblDescription);
            this.Controls.Add(this.txtQuantity);
            this.Controls.Add(this.lblQuantity);
            this.Controls.Add(this.txtDiscountAmount);
            this.Controls.Add(this.lblDiscountAmount);
            this.Controls.Add(this.txtCategory);
            this.Controls.Add(this.lblCategory);
            this.Controls.Add(this.txtSupplier);
            this.Controls.Add(this.lblSupplier);
            this.Controls.Add(this.txtManufacturer);
            this.Controls.Add(this.lblManufacturer);
            this.Controls.Add(this.txtMaxDiscount);
            this.Controls.Add(this.lblMaxDiscount);
            this.Controls.Add(this.txtCost);
            this.Controls.Add(this.lblCost);
            this.Controls.Add(this.txtUnit);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.lblArticle);
            this.Controls.Add(this.txtArticle);
            this.Controls.Add(this.pnlDown);
            this.Controls.Add(this.pnlUp);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmGoods";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Добавление товара";
            this.pnlDown.ResumeLayout(false);
            this.pnlLogo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).EndInit();
            this.pnlDiscount.ResumeLayout(false);
            this.pnlPhotoProduct.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picProduct)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlUp;
        private System.Windows.Forms.Label lblArticle;
        private System.Windows.Forms.Panel pnlDown;
        private System.Windows.Forms.Panel pnlLogo;
        private System.Windows.Forms.PictureBox picLogo;
        private System.Windows.Forms.Panel pnlDiscount;
        private System.Windows.Forms.Button btnAddProduct;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Panel pnlPhotoProduct;
        private System.Windows.Forms.TextBox txtArticle;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.TextBox txtUnit;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtCost;
        private System.Windows.Forms.Label lblCost;
        private System.Windows.Forms.TextBox txtMaxDiscount;
        private System.Windows.Forms.Label lblMaxDiscount;
        private System.Windows.Forms.TextBox txtManufacturer;
        private System.Windows.Forms.Label lblManufacturer;
        private System.Windows.Forms.TextBox txtSupplier;
        private System.Windows.Forms.Label lblSupplier;
        private System.Windows.Forms.TextBox txtCategory;
        private System.Windows.Forms.Label lblCategory;
        private System.Windows.Forms.TextBox txtDiscountAmount;
        private System.Windows.Forms.Label lblDiscountAmount;
        private System.Windows.Forms.TextBox txtQuantity;
        private System.Windows.Forms.Label lblQuantity;
        private System.Windows.Forms.TextBox txtDescription;
        private System.Windows.Forms.Label lblDescription;
        private System.Windows.Forms.TextBox txtWithDiscount;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnCostWithDiscount;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.PictureBox picProduct;
    }
}