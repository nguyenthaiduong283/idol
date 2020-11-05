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
    public partial class formCoBan3 : Form
    {


        public formCoBan3()
        {
            InitializeComponent();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
        double minites = 0.5; // 30 giây
        double currentSecond;
        private void timer1_Tick(object sender, EventArgs e)
        {
            currentSecond--;
            labClock.Text = $"{(int)currentSecond /60:0#}:{currentSecond%60:0#}";
            if (currentSecond == 0)
            {
                timer1.Stop();
                var f = new frmEndGame();
                f.ShowDialog();
            }
               
        }
            
        int getStartSecond()
        {
            var _minutes = numMinute.Value;
            var _seconds = numSecond.Value;
            return (int)(_minutes * 60 + _seconds);
        }
        private void btnStart_Click(object sender, EventArgs e)
        {
            if (currentSecond == 0)
                currentSecond = getStartSecond();
            timer1.Start();
        }

        private void panel1_Paint_1(object sender, PaintEventArgs e)
        {

        }

      
        void showStartClock()
        {
            var _minutes = numMinute.Value;
            var _seconds = numSecond.Value;
            labClock.Text = $"{(int)_minutes / 60:0#}:{_seconds % 60:0#}";
        }

        private void numSecond_ValueChanged(object sender, EventArgs e)
        {
            showStartClock();
        }

        private void numMinite_ValueChanged(object sender, EventArgs e)
        {
            showStartClock();
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            showStartClock();
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            timer1.Stop();
            labClock.Text = $"00:00";
            currentSecond = 0;
        }

        private void btnTamDung_Click(object sender, EventArgs e)
        {
            timer1.Stop();
        }

        private void btnClose(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
