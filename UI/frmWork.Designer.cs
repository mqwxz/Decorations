namespace LLC_Decoration.UI
{
    partial class frmWork
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmWork));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.pnlDown = new System.Windows.Forms.Panel();
            this.pnlLogo = new System.Windows.Forms.Panel();
            this.picLogo = new System.Windows.Forms.PictureBox();
            this.pnlProductDescription = new System.Windows.Forms.Panel();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.dtpOrder = new System.Windows.Forms.DateTimePicker();
            this.btnClose = new System.Windows.Forms.Button();
            this.cboStatus = new System.Windows.Forms.ComboBox();
            this.lblProductDescription = new System.Windows.Forms.Label();
            this.lblProductName = new System.Windows.Forms.Label();
            this.lblSortingPrice = new System.Windows.Forms.Label();
            this.cboSortingPrice = new System.Windows.Forms.ComboBox();
            this.lblSortingDiscount = new System.Windows.Forms.Label();
            this.cboSortingDiscount = new System.Windows.Forms.ComboBox();
            this.pnlUp = new System.Windows.Forms.Panel();
            this.dgvOrdersMA = new System.Windows.Forms.DataGridView();
            this.pnlDown.SuspendLayout();
            this.pnlLogo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).BeginInit();
            this.pnlProductDescription.SuspendLayout();
            this.pnlUp.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOrdersMA)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlDown
            // 
            this.pnlDown.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(204)))), ((int)(((byte)(153)))));
            this.pnlDown.Controls.Add(this.pnlLogo);
            this.pnlDown.Controls.Add(this.pnlProductDescription);
            this.pnlDown.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.pnlDown.Location = new System.Drawing.Point(0, 476);
            this.pnlDown.Name = "pnlDown";
            this.pnlDown.Size = new System.Drawing.Size(1255, 135);
            this.pnlDown.TabIndex = 2;
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
            // pnlProductDescription
            // 
            this.pnlProductDescription.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlProductDescription.Controls.Add(this.btnUpdate);
            this.pnlProductDescription.Controls.Add(this.dtpOrder);
            this.pnlProductDescription.Controls.Add(this.btnClose);
            this.pnlProductDescription.Controls.Add(this.cboStatus);
            this.pnlProductDescription.Controls.Add(this.lblProductDescription);
            this.pnlProductDescription.Controls.Add(this.lblProductName);
            this.pnlProductDescription.Location = new System.Drawing.Point(186, 3);
            this.pnlProductDescription.Name = "pnlProductDescription";
            this.pnlProductDescription.Size = new System.Drawing.Size(1066, 129);
            this.pnlProductDescription.TabIndex = 1;
            // 
            // btnUpdate
            // 
            this.btnUpdate.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnUpdate.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUpdate.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnUpdate.Location = new System.Drawing.Point(695, 84);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(0, 3, 3, 3);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(235, 38);
            this.btnUpdate.TabIndex = 17;
            this.btnUpdate.Text = "Изменить данные";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // dtpOrder
            // 
            this.dtpOrder.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.dtpOrder.Location = new System.Drawing.Point(215, 31);
            this.dtpOrder.Name = "dtpOrder";
            this.dtpOrder.Size = new System.Drawing.Size(200, 30);
            this.dtpOrder.TabIndex = 16;
            // 
            // btnClose
            // 
            this.btnClose.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnClose.Location = new System.Drawing.Point(933, 84);
            this.btnClose.Margin = new System.Windows.Forms.Padding(0, 3, 3, 3);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(126, 38);
            this.btnClose.TabIndex = 15;
            this.btnClose.Text = "Выход";
            this.btnClose.UseVisualStyleBackColor = false;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // cboStatus
            // 
            this.cboStatus.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.cboStatus.FormattingEnabled = true;
            this.cboStatus.Items.AddRange(new object[] {
            "Новый",
            "Завершен"});
            this.cboStatus.Location = new System.Drawing.Point(39, 31);
            this.cboStatus.Name = "cboStatus";
            this.cboStatus.Size = new System.Drawing.Size(139, 31);
            this.cboStatus.TabIndex = 7;
            // 
            // lblProductDescription
            // 
            this.lblProductDescription.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblProductDescription.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblProductDescription.Location = new System.Drawing.Point(223, 2);
            this.lblProductDescription.Name = "lblProductDescription";
            this.lblProductDescription.Size = new System.Drawing.Size(191, 25);
            this.lblProductDescription.TabIndex = 8;
            this.lblProductDescription.Text = "Дата доставки";
            this.lblProductDescription.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblProductName
            // 
            this.lblProductName.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblProductName.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblProductName.Location = new System.Drawing.Point(3, 3);
            this.lblProductName.Name = "lblProductName";
            this.lblProductName.Size = new System.Drawing.Size(217, 25);
            this.lblProductName.TabIndex = 7;
            this.lblProductName.Text = "Статус заказа";
            this.lblProductName.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // lblSortingPrice
            // 
            this.lblSortingPrice.AutoSize = true;
            this.lblSortingPrice.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblSortingPrice.Location = new System.Drawing.Point(8, 8);
            this.lblSortingPrice.Name = "lblSortingPrice";
            this.lblSortingPrice.Size = new System.Drawing.Size(327, 23);
            this.lblSortingPrice.TabIndex = 2;
            this.lblSortingPrice.Text = "Отсортировать по суммарной стоимости";
            // 
            // cboSortingPrice
            // 
            this.cboSortingPrice.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.cboSortingPrice.FormattingEnabled = true;
            this.cboSortingPrice.Items.AddRange(new object[] {
            "По возрастанию",
            "По убыванию"});
            this.cboSortingPrice.Location = new System.Drawing.Point(57, 34);
            this.cboSortingPrice.Name = "cboSortingPrice";
            this.cboSortingPrice.Size = new System.Drawing.Size(232, 31);
            this.cboSortingPrice.TabIndex = 3;
            this.cboSortingPrice.SelectedIndexChanged += new System.EventHandler(this.cboSortingPrice_SelectedIndexChanged);
            // 
            // lblSortingDiscount
            // 
            this.lblSortingDiscount.AutoSize = true;
            this.lblSortingDiscount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.lblSortingDiscount.Location = new System.Drawing.Point(379, 8);
            this.lblSortingDiscount.Name = "lblSortingDiscount";
            this.lblSortingDiscount.Size = new System.Drawing.Size(301, 23);
            this.lblSortingDiscount.TabIndex = 5;
            this.lblSortingDiscount.Text = "Отфильтровать по суммарной скидке";
            // 
            // cboSortingDiscount
            // 
            this.cboSortingDiscount.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.cboSortingDiscount.FormattingEnabled = true;
            this.cboSortingDiscount.Items.AddRange(new object[] {
            "Все диапазоны",
            "0-10%",
            "11-14%",
            "15% и более "});
            this.cboSortingDiscount.Location = new System.Drawing.Point(415, 34);
            this.cboSortingDiscount.Name = "cboSortingDiscount";
            this.cboSortingDiscount.Size = new System.Drawing.Size(232, 31);
            this.cboSortingDiscount.TabIndex = 6;
            this.cboSortingDiscount.SelectedIndexChanged += new System.EventHandler(this.cboSortingDiscount_SelectedIndexChanged);
            // 
            // pnlUp
            // 
            this.pnlUp.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(204)))), ((int)(((byte)(153)))));
            this.pnlUp.Controls.Add(this.cboSortingDiscount);
            this.pnlUp.Controls.Add(this.lblSortingDiscount);
            this.pnlUp.Controls.Add(this.cboSortingPrice);
            this.pnlUp.Controls.Add(this.lblSortingPrice);
            this.pnlUp.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlUp.Location = new System.Drawing.Point(0, 0);
            this.pnlUp.Name = "pnlUp";
            this.pnlUp.Size = new System.Drawing.Size(1255, 135);
            this.pnlUp.TabIndex = 1;
            // 
            // dgvOrdersMA
            // 
            this.dgvOrdersMA.AllowUserToAddRows = false;
            this.dgvOrdersMA.AllowUserToDeleteRows = false;
            this.dgvOrdersMA.AllowUserToResizeColumns = false;
            this.dgvOrdersMA.AllowUserToResizeRows = false;
            this.dgvOrdersMA.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvOrdersMA.BackgroundColor = System.Drawing.Color.White;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Comic Sans MS", 9F);
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvOrdersMA.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvOrdersMA.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Comic Sans MS", 9F);
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvOrdersMA.DefaultCellStyle = dataGridViewCellStyle5;
            this.dgvOrdersMA.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvOrdersMA.Location = new System.Drawing.Point(0, 135);
            this.dgvOrdersMA.Margin = new System.Windows.Forms.Padding(0);
            this.dgvOrdersMA.Name = "dgvOrdersMA";
            this.dgvOrdersMA.ReadOnly = true;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Comic Sans MS", 9F);
            dataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvOrdersMA.RowHeadersDefaultCellStyle = dataGridViewCellStyle6;
            this.dgvOrdersMA.Size = new System.Drawing.Size(1255, 341);
            this.dgvOrdersMA.TabIndex = 3;
            this.dgvOrdersMA.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvOrdersMA_CellMouseClick);
            // 
            // frmWork
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1255, 611);
            this.Controls.Add(this.dgvOrdersMA);
            this.Controls.Add(this.pnlDown);
            this.Controls.Add(this.pnlUp);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmWork";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Работа с заказами";
            this.pnlDown.ResumeLayout(false);
            this.pnlLogo.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).EndInit();
            this.pnlProductDescription.ResumeLayout(false);
            this.pnlUp.ResumeLayout(false);
            this.pnlUp.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOrdersMA)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel pnlDown;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Panel pnlLogo;
        private System.Windows.Forms.PictureBox picLogo;
        private System.Windows.Forms.Panel pnlProductDescription;
        private System.Windows.Forms.Label lblProductName;
        private System.Windows.Forms.Label lblSortingPrice;
        private System.Windows.Forms.ComboBox cboSortingPrice;
        private System.Windows.Forms.Label lblSortingDiscount;
        private System.Windows.Forms.ComboBox cboSortingDiscount;
        private System.Windows.Forms.Panel pnlUp;
        private System.Windows.Forms.DataGridView dgvOrdersMA;
        private System.Windows.Forms.ComboBox cboStatus;
        private System.Windows.Forms.Label lblProductDescription;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.DateTimePicker dtpOrder;
    }
}