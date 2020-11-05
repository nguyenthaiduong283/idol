using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Winform
{
    public partial class frmCoBan2 : Form
    {
        public frmCoBan2()
        {
            InitializeComponent();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            var t = Age(dtpNgaySinh.Value);
            var rs = $"Tuổi của bạn là {t}"; 
            MessageBox.Show(rs);
        }
        int Age(DateTime birthDay) {
            var age = DateTime.Now.Year - birthDay.Year; 
            return age; 
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void trbCanNang_Scroll(object sender, EventArgs e)
        {
            lblCanNang.Text = $"{trbCanNang.Value.ToString("N0")}g";
        }

        private void label5_Click_1(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
