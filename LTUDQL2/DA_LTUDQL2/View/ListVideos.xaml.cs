using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace DA_LTUDQL2.View
{
    /// <summary>
    /// Interaction logic for ListVideos.xaml
    /// </summary>
    public partial class ListVideos : UserControl
    {
        ObservableCollection<Model.Object> listvideo;
        string lName = "";
        Home Child;
        public void SetChild(Home frm)
        {
            Child = frm;
        }
        public ListVideos()
        {
            InitializeComponent();
            listvideo = new ObservableCollection<Model.Object>();
            lbnamelist.Content = lName;
            DataContext = listvideo;
        }
        public ListVideos(ObservableCollection<Model.Object> lst, string str)
        {
            InitializeComponent();
            listvideo = new ObservableCollection<Model.Object>();
            listvideo = lst;
            lName = str;
            lbnamelist.Content = lName;
            DataContext = listvideo;       

        }
        public ListVideos(Home frm)
        {
            InitializeComponent();
            Child = frm;
            listvideo = new ObservableCollection<Model.Object>();
            lbnamelist.Content = lName;
            DataContext = listvideo;
        }
        public void SetListvideo(ObservableCollection<Model.Object> lst)
        {
            listvideo=lst;
        }
        public void SetName(string name)
        {
            lName = name;
            lbnamelist.Content = lName;
        }

        int timebegin;
        bool isEnter = false;
        private void grScroll_MouseEnter(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            me.Visibility = Visibility.Visible;



            timebegin = 3000;


            if (isEnter)
            {
                timebegin = 1000;
            }
            try
            {
                me?.Play();
                me.Volume = 0;
            }
            catch { }
            
            var sxDA = new DoubleAnimation();
            sxDA.To = 1.6;
            sxDA.BeginTime = TimeSpan.FromMilliseconds(500);
            sxDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(sxDA, gr);
            Storyboard.SetTargetProperty(sxDA, new PropertyPath("LayoutTransform.ScaleX"));

            var syDA = new DoubleAnimation();
            syDA.To = 1.6;
            syDA.BeginTime = TimeSpan.FromMilliseconds(500);
            syDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(syDA, gr);
            Storyboard.SetTargetProperty(syDA, new PropertyPath("LayoutTransform.ScaleY"));

            var sb = new Storyboard();
            sb.Children.Add(sxDA);
            sb.Children.Add(syDA);

            sb.Begin();
        }

        private void Scroll_MouseEnter(object sender, MouseEventArgs e)
        {
            isEnter = true;
        }

        private void Scroll_MouseLeave(object sender, MouseEventArgs e)
        {
            isEnter = false;
        }

        private void grScroll_MouseLeave(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            me.Visibility = Visibility.Collapsed;
            try
            {
                me?.Stop();
            }
            catch
            {

            }

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
        MediaElement m = new MediaElement();
        public void grScroll_MouseDown(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var vi = gr.Tag as Model.Object;
            Child.SenderVideo(vi);
        }

    }
}
