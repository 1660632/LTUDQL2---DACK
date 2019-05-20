﻿using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class UserRoleViewModel:BaseViewModel
    {
        private ObservableCollection<UserRole> _List;
        private UserRole _SelectedItem;// nhấn để hiện ra trên textbox
        private string _DisplayName;
        private int _Id;

        public ObservableCollection<UserRole> List
        {
            get
            {
                return _List;
            }

            set
            {
                _List = value;
                OnPropertyChanged();
            }
        }
        public string DisplayName
        {
            get
            {
                return _DisplayName;
            }

            set
            {
                _DisplayName = value;
                OnPropertyChanged();
            }
        }
        public UserRole SelectedItem
        {
            get
            {
                return _SelectedItem;
            }

            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                }
            }
        }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public int Id
        {
            get
            {
                return _Id;
            }

            set
            {
                _Id = value;
                OnPropertyChanged();
            }
        }

        public UserRoleViewModel()
        {
            List = new ObservableCollection<UserRole>(DataProvider.Ins.DB.UserRoles);// hiển thị danh sách

            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName))
                    return false;

                var displayList = DataProvider.Ins.DB.UserRoles.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() == 0)
                    return true;

                return false;
            }, (p) =>
            {
                var role = new UserRole() { Id = Id, DisplayName = DisplayName };
                DataProvider.Ins.DB.UserRoles.Add(role);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(role);
                
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName) || SelectedItem == null)
                    return false;

                var displayList = DataProvider.Ins.DB.UserRoles.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() == 0)
                    return true;

                return false;
            }, (p) =>
            {
                var role = DataProvider.Ins.DB.UserRoles.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();//lấy ra id tương ứng
                role.DisplayName = DisplayName;
                DataProvider.Ins.DB.SaveChanges();

                SelectedItem.DisplayName = DisplayName;

                var roleList = List.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                role.DisplayName = DisplayName;

            });
        }
    }
}
