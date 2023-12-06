namespace LLC_Decoration
{
    partial class frmAuth
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAuth));
            this.pnlUp = new System.Windows.Forms.Panel();
            this.picLogo = new System.Windows.Forms.PictureBox();
            this.lblShopName = new System.Windows.Forms.Label();
            this.btnAuth = new System.Windows.Forms.Button();
            this.btnGuest = new System.Windows.Forms.Button();
            this.lblLogin = new System.Windows.Forms.Label();
            this.txtLogin = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.chkPassword = new System.Windows.Forms.CheckBox();
            this.chkRemember = new System.Windows.Forms.CheckBox();
            this.picCaptcha = new System.Windows.Forms.PictureBox();
            this.lblCaptcha = new System.Windows.Forms.Label();
            this.txtCaptcha = new System.Windows.Forms.TextBox();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnAnswer = new System.Windows.Forms.Button();
            this.pnlUp.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picCaptcha)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlUp
            // 
            this.pnlUp.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(204)))), ((int)(((byte)(153)))));
            this.pnlUp.Controls.Add(this.picLogo);
            this.pnlUp.Controls.Add(this.lblShopName);
            this.pnlUp.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlUp.Location = new System.Drawing.Point(0, 0);
            this.pnlUp.Name = "pnlUp";
            this.pnlUp.Size = new System.Drawing.Size(309, 100);
            this.pnlUp.TabIndex = 0;
            // 
            // picLogo
            // 
            this.picLogo.Image = ((System.Drawing.Image)(resources.GetObject("picLogo.Image")));
            this.picLogo.Location = new System.Drawing.Point(179, 3);
            this.picLogo.Name = "picLogo";
            this.picLogo.Size = new System.Drawing.Size(127, 94);
            this.picLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picLogo.TabIndex = 1;
            this.picLogo.TabStop = false;
            // 
            // lblShopName
            // 
            this.lblShopName.AutoSize = true;
            this.lblShopName.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblShopName.Location = new System.Drawing.Point(12, 36);
            this.lblShopName.Name = "lblShopName";
            this.lblShopName.Size = new System.Drawing.Size(161, 23);
            this.lblShopName.TabIndex = 0;
            this.lblShopName.Text = "ООО «Украшение»";
            // 
            // btnAuth
            // 
            this.btnAuth.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnAuth.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnAuth.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAuth.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnAuth.Location = new System.Drawing.Point(0, 534);
            this.btnAuth.Name = "btnAuth";
            this.btnAuth.Size = new System.Drawing.Size(309, 38);
            this.btnAuth.TabIndex = 9;
            this.btnAuth.Text = "Войти";
            this.btnAuth.UseVisualStyleBackColor = false;
            this.btnAuth.Click += new System.EventHandler(this.btnAuth_Click);
            // 
            // btnGuest
            // 
            this.btnGuest.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnGuest.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnGuest.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuest.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnGuest.Location = new System.Drawing.Point(0, 572);
            this.btnGuest.Name = "btnGuest";
            this.btnGuest.Size = new System.Drawing.Size(309, 38);
            this.btnGuest.TabIndex = 10;
            this.btnGuest.Text = "Войти как гость";
            this.btnGuest.UseVisualStyleBackColor = false;
            this.btnGuest.Click += new System.EventHandler(this.btnGuest_Click);
            // 
            // lblLogin
            // 
            this.lblLogin.AutoSize = true;
            this.lblLogin.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Bold);
            this.lblLogin.Location = new System.Drawing.Point(123, 103);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(58, 23);
            this.lblLogin.TabIndex = 2;
            this.lblLogin.Text = "Логин";
            // 
            // txtLogin
            // 
            this.txtLogin.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txtLogin.Location = new System.Drawing.Point(49, 129);
            this.txtLogin.MaxLength = 20;
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(208, 30);
            this.txtLogin.TabIndex = 3;
            this.txtLogin.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtPassword
            // 
            this.txtPassword.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txtPassword.Location = new System.Drawing.Point(49, 189);
            this.txtPassword.MaxLength = 20;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(208, 30);
            this.txtPassword.TabIndex = 5;
            this.txtPassword.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Bold);
            this.lblPassword.Location = new System.Drawing.Point(117, 163);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(70, 23);
            this.lblPassword.TabIndex = 4;
            this.lblPassword.Text = "Пароль";
            // 
            // chkPassword
            // 
            this.chkPassword.AutoSize = true;
            this.chkPassword.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.chkPassword.Location = new System.Drawing.Point(73, 227);
            this.chkPassword.Name = "chkPassword";
            this.chkPassword.Size = new System.Drawing.Size(159, 27);
            this.chkPassword.TabIndex = 6;
            this.chkPassword.Text = "Показать пароль";
            this.chkPassword.UseVisualStyleBackColor = true;
            this.chkPassword.CheckedChanged += new System.EventHandler(this.chkPassword_CheckedChanged);
            // 
            // chkRemember
            // 
            this.chkRemember.AutoSize = true;
            this.chkRemember.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.chkRemember.Location = new System.Drawing.Point(73, 260);
            this.chkRemember.Name = "chkRemember";
            this.chkRemember.Size = new System.Drawing.Size(155, 27);
            this.chkRemember.TabIndex = 7;
            this.chkRemember.Text = "Запомнить меня";
            this.chkRemember.UseVisualStyleBackColor = true;
            this.chkRemember.CheckedChanged += new System.EventHandler(this.chkRemember_CheckedChanged);
            // 
            // picCaptcha
            // 
            this.picCaptcha.Location = new System.Drawing.Point(49, 319);
            this.picCaptcha.Name = "picCaptcha";
            this.picCaptcha.Size = new System.Drawing.Size(208, 88);
            this.picCaptcha.TabIndex = 8;
            this.picCaptcha.TabStop = false;
            this.picCaptcha.Visible = false;
            // 
            // lblCaptcha
            // 
            this.lblCaptcha.AutoSize = true;
            this.lblCaptcha.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Bold);
            this.lblCaptcha.Location = new System.Drawing.Point(88, 293);
            this.lblCaptcha.Name = "lblCaptcha";
            this.lblCaptcha.Size = new System.Drawing.Size(125, 23);
            this.lblCaptcha.TabIndex = 11;
            this.lblCaptcha.Text = "Введите капчу";
            this.lblCaptcha.Visible = false;
            // 
            // txtCaptcha
            // 
            this.txtCaptcha.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.txtCaptcha.Location = new System.Drawing.Point(49, 413);
            this.txtCaptcha.MaxLength = 20;
            this.txtCaptcha.Name = "txtCaptcha";
            this.txtCaptcha.Size = new System.Drawing.Size(208, 30);
            this.txtCaptcha.TabIndex = 12;
            this.txtCaptcha.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtCaptcha.Visible = false;
            // 
            // btnReset
            // 
            this.btnReset.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnReset.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnReset.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnReset.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnReset.Location = new System.Drawing.Point(0, 496);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(309, 38);
            this.btnReset.TabIndex = 13;
            this.btnReset.Text = "Сбросить капчу";
            this.btnReset.UseVisualStyleBackColor = false;
            this.btnReset.Visible = false;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnAnswer
            // 
            this.btnAnswer.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.btnAnswer.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnAnswer.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAnswer.Font = new System.Drawing.Font("Comic Sans MS", 12F);
            this.btnAnswer.Location = new System.Drawing.Point(0, 458);
            this.btnAnswer.Name = "btnAnswer";
            this.btnAnswer.Size = new System.Drawing.Size(309, 38);
            this.btnAnswer.TabIndex = 14;
            this.btnAnswer.Text = "Проверить капчу";
            this.btnAnswer.UseVisualStyleBackColor = false;
            this.btnAnswer.Visible = false;
            this.btnAnswer.Click += new System.EventHandler(this.btnAnswer_Click);
            // 
            // frmAuth
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(309, 610);
            this.Controls.Add(this.btnAnswer);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.txtCaptcha);
            this.Controls.Add(this.lblCaptcha);
            this.Controls.Add(this.btnAuth);
            this.Controls.Add(this.picCaptcha);
            this.Controls.Add(this.btnGuest);
            this.Controls.Add(this.chkRemember);
            this.Controls.Add(this.chkPassword);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.txtLogin);
            this.Controls.Add(this.lblLogin);
            this.Controls.Add(this.pnlUp);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmAuth";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Авторизация";
            this.pnlUp.ResumeLayout(false);
            this.pnlUp.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picCaptcha)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlUp;
        private System.Windows.Forms.PictureBox picLogo;
        private System.Windows.Forms.Label lblShopName;
        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.TextBox txtLogin;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.CheckBox chkPassword;
        private System.Windows.Forms.CheckBox chkRemember;
        private System.Windows.Forms.PictureBox picCaptcha;
        private System.Windows.Forms.Button btnAuth;
        private System.Windows.Forms.Button btnGuest;
        private System.Windows.Forms.Label lblCaptcha;
        private System.Windows.Forms.TextBox txtCaptcha;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnAnswer;
    }
}

