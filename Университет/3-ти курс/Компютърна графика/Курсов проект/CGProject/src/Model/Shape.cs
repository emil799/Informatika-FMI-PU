using System;
using System.Drawing;


namespace Draw
{
    /// <summary>
    /// The base class of primitives, which contains the general characteristics of primitives.
    /// </summary>
	[Serializable]
    public abstract class Shape
	{
		#region Constructors
		
		public Shape()
		{
		}
		
		public Shape(RectangleF rect)
		{
			rectangle = rect;
		}
		
		public Shape(Shape shape)
		{
			this.Height = shape.Height;
			this.Width = shape.Width;
			this.Location = shape.Location;
			this.rectangle = shape.rectangle;
			
			this.FillColor =  shape.FillColor;
		}
        #endregion

        #region Properties

        /// <summary>
        /// The element's bounding rectangle.
        /// </summary>
        private RectangleF rectangle;		
		public virtual RectangleF Rectangle {
			get { return rectangle; }
			set { rectangle = value; }
		}

        /// <summary>
        /// Width of the element.
        /// </summary>
        public virtual float Width {
			get { return Rectangle.Width; }
			set { rectangle.Width = value; }
		}

        /// <summary>
        /// Height of the element.
        /// </summary>
        public virtual float Height {
			get { return Rectangle.Height; }
			set { rectangle.Height = value; }
		}

        /// <summary>
        /// Top left corner of element.
        /// </summary>
        public virtual PointF Location {
			get { return Rectangle.Location; }
			set { rectangle.Location = value; }
		}

        /// <summary>
        /// Color of the element.
        /// </summary>
        private Color fillColor;		
		public virtual Color FillColor {
			get { return fillColor; }
			set { fillColor = value; }
		}

        private Color strokeColor;
        public virtual Color StrokeColor
        {
            get { return strokeColor; }
            set { strokeColor = value; }
        }

        #endregion


        /// <summary>
        /// Checking if point belongs to the element.
        /// </summary>
        /// <param name="point">Point</param>
        /// <returns>Returns true if the point belongs to the element and
        /// false, if it does not.</returns>
        public virtual bool Contains(PointF point)
		{
			return Rectangle.Contains(point.X, point.Y);
		}
		
		/// <summary>
		/// Visualise the element.
		/// </summary>
		/// <param name="grfx">Where to visualise the element.</param>
		public virtual void DrawSelf(Graphics grfx)
		{
			// shape.Rectangle.Inflate(shape.BorderWidth, shape.BorderWidth);
		}
		
	} // end of class Shape
}
