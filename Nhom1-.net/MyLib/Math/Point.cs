using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLib.Math
{
    public class Point
    {
        #region Properties
        public int x { get; set; }
        public int y { get; set; }

        #endregion

        #region Constructor
        public Point()
        {
            x = 0; y = 0;
        }
        public Point(int x, int y)
        {
            this.x = x;
            this.y = y;
        }
        public Point(Point p)
        {
            x = p.x; y = p.y;

        }
        #endregion

        #region Methods
        
        /// <summary>
        /// Tính khoảng cách của đối tượng đến gốc tọa độ O(0,0)
        /// </summary>
        /// <returns>Khoảng cách của đối tượng đến điểm O</returns>
        public double Distance()
        {
            double d = Math.Sqrt(x * x + Math.Pow(y, 2));
            return d;
        }

        /// <summary>
        /// tính khoảng cách từ đối tượng đến điểm p (px, py)
        /// </summary>
        /// <param name="p">Điểm cần tính khoảng cách đến</param>
        /// <returns>Khoảng cách đến điểm p</returns>
        public double Distance(Point p)
        {
            double d = Math.Sqrt(Math.Pow(x - p.x, 2) + Math.Pow(y - p.y, 2));
            return d;
        }

        public override string ToString()
        {
            String output = String.Format("Toa do: ({0}, {1})",x, y);
            return output;
        }
        #endregion
    }
}
