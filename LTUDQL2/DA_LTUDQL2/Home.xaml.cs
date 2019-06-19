using DA_LTUDQL2.Model;
using DA_LTUDQL2.View;
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
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DA_LTUDQL2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class Home : Window
    {
        public string TenND;
        public delegate void SendVideo(Model.Object media);
        public SendVideo SenderVideo;
        private ViewModel.HomeViewModel data = new ViewModel.HomeViewModel();
        public delegate void SendIV(Model.Object video);
        public SendIV SenderIV;
        InfoVideo infoVideo;
        WatchVideo watchVideo;
        private void GetVideo(Model.Object video)
        {

            stackPn.Children.Clear();
            //watchVideo.SetVideo(video);
            //watchVideo.Height = 480;
            //watchVideo.Visibility = Visibility.Visible;
            //stackPn.Children.Add(watchVideo);            
            watchVideo.ClearVideo();
            infoVideo.SetVideo(video);
            stackPn.Children.Add(infoVideo);
            foreach(var i in data.VideoList)
            {
                stackPn.Children.Add(i);
            }
            //load stackPn lai voi nhung video lien quan
        }
        private void GetIV(Model.Object video)
        {
            stackPn.Children.Clear();
            watchVideo.SetVideo(video);
            stackPn.Children.Add(watchVideo);
            foreach (var i in data.VideoList)
            {
                stackPn.Children.Add(i);
            }
        }       
        public Home(string a)
        {
            InitializeComponent();
            infoVideo = new InfoVideo(this);
            watchVideo = new WatchVideo();
            SenderVideo = new SendVideo(GetVideo);
            SenderIV = new SendIV(GetIV);
            foreach (var i in data.VideoList)
            {
                i.SetChild(this);
                stackPn.Children.Add(i);
            }
            btnName.Content = a;
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            watchVideo.ClearVideo();
            stackPn.Children.Clear();
            foreach (var i in data.VideoList)
            {
                stackPn.Children.Add(i);
            }
            //load laij stackPn cho dung
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            if(btnName.Content.ToString() != "")
            {
                MainWindow main = new MainWindow();
                main.Coppy(1);
                main.MoWin(btnName.Content.ToString());
                main.Show();
            }
        }

        private void btnName_Click(object sender, RoutedEventArgs e)
        {
            IQueryable<Userr> idrole = from Userr in DataProvider.Ins.DB.Userrs
                                       where Userr.DisplayName == btnName.Content.ToString()
                                       select Userr;
            Userr role = idrole.SingleOrDefault();
            var p = new ProfileUC(role.Id.ToString(), role.Email, role.DisplayName, role.Password);
            gridAbove.Children.Add(p);          
        }

        private void btnUser_Click(object sender, RoutedEventArgs e)
        {
            var p = new FavorUC();
            gridAbove.Children.Add(p);
        }
    }
}
