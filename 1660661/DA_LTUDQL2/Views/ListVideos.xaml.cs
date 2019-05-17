using DA_LTUDQL2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DA_LTUDQL2.Views
{
    /// <summary>
    /// Interaction logic for ListVideos.xaml
    /// </summary>
    public partial class ListVideos : UserControl
    {
        List<VideoInfo> listvideo;
        string lName = "";
        MainWindow Child;
        public ListVideos(MainWindow frm)
        {
            InitializeComponent();
            Child = frm;
            listvideo = new List<VideoInfo>();
            lbnamelist.Content = lName;
            DataContext = listvideo;
        }
        public ListVideos()
        {
            InitializeComponent();
            listvideo = new List<VideoInfo>();
            lbnamelist.Content = lName;
            DataContext = listvideo; 
        }
        public void SetListvideo(List<VideoInfo> lst)
        {
            listvideo.AddRange(lst);
        }
        public void SetName(string name)
        {
            lName = name;
            lbnamelist.Content = lName;
        }
        int timebegin = 5000;
        bool isEnter = false;
        private void Grid_MouseEnter(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            me.Visibility = Visibility.Visible;
            me?.Play();



            timebegin = 5000;


            if (isEnter)
            {
                timebegin = 500;
            }

            var sxDA = new DoubleAnimation();
            sxDA.To = 1.5;
            sxDA.BeginTime = TimeSpan.FromMilliseconds(500);
            sxDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(sxDA, gr);
            Storyboard.SetTargetProperty(sxDA, new PropertyPath("LayoutTransform.ScaleX"));

            var syDA = new DoubleAnimation();
            syDA.To = 1.5;
            syDA.BeginTime = TimeSpan.FromMilliseconds(500);
            syDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(syDA, gr);
            Storyboard.SetTargetProperty(syDA, new PropertyPath("LayoutTransform.ScaleY"));

            var sb = new Storyboard();
            sb.Children.Add(sxDA);
            sb.Children.Add(syDA);

            sb.Begin();
        }

        private void Grid_MouseLeave(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            me.Visibility = Visibility.Collapsed;
            me?.Stop();

            var sxDA = new DoubleAnimation();
            sxDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(sxDA, gr);
            Storyboard.SetTargetProperty(sxDA, new PropertyPath("LayoutTransform.ScaleX"));

            var syDA = new DoubleAnimation();
            syDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(syDA, gr);
            Storyboard.SetTargetProperty(syDA, new PropertyPath("LayoutTransform.ScaleY"));

            var sb = new Storyboard();
            sb.Children.Add(sxDA);
            sb.Children.Add(syDA);
            sb.Begin();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Grid gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            Child.SenderVideo(me);
        }
    }
}
