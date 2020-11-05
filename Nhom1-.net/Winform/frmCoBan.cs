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
    public partial class frmCoBan : Form
    {
        public frmCoBan()
        {
            InitializeComponent();
        }

        private void txtA_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtB_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void btnCong_Click(object sender, EventArgs e)
        {
            try
            {
                double temp = 0;
                if (!double.TryParse(txtA.Text, out temp))
                {
                    MessageBox.Show("Bạn phải nhập số A");
                    return;
                }
                if (!double.TryParse(txtB.Text, out temp))
                {
                    MessageBox.Show("Bạn phải nhập số B");
                    return;
                }

                var a = Convert.ToDouble(txtA.Text);
                var b = Convert.ToDouble(txtB.Text);
                var c = Cong(a, b);
                var rs = $"{a} + {b} = {c}";
                MessageBox.Show(rs);
                //var rs = String.Format("A = {0}, B = {1}", a, b);
                //var rs2 = $"A = {a}, B = {b}";
                //MessageBox.Show(rs2);
            }
            catch (FormatException ex)
            {
                MessageBox.Show($"Bạn phải nhập số. Chi tiết: {ex.Message}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi. Chi tiết: {ex.Message}");
            }
        }
        double Cong(double a, double b)
        {
            return a + b;
        }
    }
}
