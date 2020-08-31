using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace App
{
    public class WriteBlock : Block
    {
        //Рандом
        public WriteBlock()
        {
            GetRandom();
        }
        //Копирование
        public WriteBlock(WriteBlock write) : base(write)
        {
            Description = write.Description;
            Fixed = write.Fixed;
        }
        //Загрузка
        public WriteBlock(string Name, Block.Icon IconId, DateTime Created, string Description, bool Fixed) : base(Name, IconId, Created)
        {
            if (Name == string.Empty)
            {
                GetRandom();
            }
            else
            {
                this.Description = Description;
                this.Fixed = Fixed;
            }
        }

        ~WriteBlock()
        {

        }

        public void Change(WriteBlock block)
        {
            base.Change(block);
            Description = block.Description;
            Fixed = block.Fixed;
        }

        public string Description { get; private set; } //Описание
        public bool Fixed { get; private set; } //Закреплено

        protected override void GetRandom()
        {
            Random r = new Random();
            WriteBlock[] WB =
            {
                new WriteBlock("Случайная заметка", (Icon)r.Next(1, Icons.Length), DateTime.Now, "Я написал это случайно.", false)
            };
            Change(WB[r.Next() % WB.Length]);
        }

        //Только для сортировки
        public static bool operator >(WriteBlock write1, WriteBlock write2)
        {
            //Закреплено
            if (write1.Fixed != write2.Fixed)
            {
                if (write1.Fixed) return false;
                else return true;
            }
            //Дата создания
            if (write1.Created > write2.Created) return false;
            else if (write1.Created < write2.Created) return true;
            //Алфавит
            if (write1.Name.CompareTo(write2.Name) > 0) return true;
            else return false;
        }

        public static bool operator <(WriteBlock write1, WriteBlock write2)
        {
            return false;
        }

        public static void Sort(ref List<WriteBlock> list)
        {
            ShellSort(4, ref list);
            ShellSort(2, ref list);
            ShellSort(1, ref list);
        }

        private static void ShellSort(int distance, ref List<WriteBlock> list)
        {
            WriteBlock value;
            int index;
            for (int i = 1; i < list.Count; i++)
            {
                value = list[i];
                index = i;
                while (index >= distance && list[index - distance] > value)
                {
                    list[index] = list[index - distance];
                    index = index - distance;
                }
                list[index] = value;
            }
        }
    }
}