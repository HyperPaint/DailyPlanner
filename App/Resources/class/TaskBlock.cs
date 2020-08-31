using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App
{
    public class TaskBlock : Block
    {
        public enum UrgentImportant : int
        {
            urgent_important, //срочно и важно
            urgent_notimportant, // срочно и не важно
            noturgent_important, // не срочно и важно 
            noturgent_notimportant // не срочно не важно
        }

        public enum Repeat : int
        {
            no_repeat, //не повторять
            every_x_day, //каждый х день
            selected_day_week, //раз в неделю
            selected_day_month, //раз в месяц
            selected_day_year//раз в год
        }
        //Рандом
        public TaskBlock()
        {
            GetRandom();
        }
        //Копирование
        public TaskBlock(TaskBlock task) : base(task)
        {
            this.Description = task.Description;
            this.UrgentImportantType = task.UrgentImportantType;
            this.RepeatType = task.RepeatType;
            this.RepeatDay = task.RepeatDay;
            this.UseDate = task.UseDate;
            this.Date = task.Date;
        }
        //Загрузка
        public TaskBlock(string Name, Block.Icon IconId, DateTime Created, string Description, UrgentImportant UrgentImportantType, Repeat RepeatType, int RepeatDay, bool UseDate, DateTime Date) : base(Name, IconId, Created)
        {
            if (Name == string.Empty)
            {
                GetRandom();
            }
            else
            {
                this.Description = Description;
                this.UrgentImportantType = UrgentImportantType;
                this.RepeatType = RepeatType;
                this.RepeatDay = RepeatDay;
                this.UseDate = UseDate;
                this.Date = Date;
            }
        }

        ~TaskBlock()
        {

        }

        public void Change(TaskBlock block)
        {
            base.Change(block);
            this.Description = block.Description;
            this.UrgentImportantType = block.UrgentImportantType;
            this.RepeatType = block.RepeatType;
            this.RepeatDay = block.RepeatDay;
            this.UseDate = block.UseDate;
            this.Date = block.Date;
        }

        public string Description { get; private set; } //Описание
        public UrgentImportant UrgentImportantType { get; private set; } //срочность-важность

        public bool IsUrgent()
        {
            if (UrgentImportantType == UrgentImportant.urgent_important || UrgentImportantType == UrgentImportant.urgent_notimportant) return true;
            else return false;
        }

        public bool IsImportant()
        {
            if (UrgentImportantType == UrgentImportant.urgent_important || UrgentImportantType == UrgentImportant.noturgent_important) return true;
            else return false;
        }

        public Repeat RepeatType { get; private set; } //тип повторения
        public int RepeatDay { get; private set; } //день
        public bool UseDate { get; private set; } //использовать дату
        public DateTime Date { get; private set; } //дата задачи

        public void GetTimeLeft(out int Days, out int Hours, out int Minutes)
        {
            TimeSpan Calculate = (Date - DateTime.Now);
            Days = Calculate.Days;
            Hours = Calculate.Hours;
            Minutes = Calculate.Minutes;
        }

        protected override void GetRandom()
        {
            Random r = new Random();
            TaskBlock[] TB =
            {
                new TaskBlock("Создать нормальную задачу", (Icon)r.Next(1, Icons.Length), DateTime.Now, "Название было введено неверно, поэтому сработало случайное создание.", UrgentImportant.urgent_important, Repeat.no_repeat, 0, true, DateTime.Now)
            };
            Change(TB[r.Next() % TB.Length]);
        }

        public bool Complete()
        {
            switch (RepeatType)
            {
                case Repeat.no_repeat: { return false; }
                case Repeat.every_x_day: { Date = Date.AddDays(RepeatDay); return true; }
                case Repeat.selected_day_week: { Date = Date.AddDays(7); return true; }
                case Repeat.selected_day_month: { Date = Date.AddMonths(1); return true; }
                case Repeat.selected_day_year: { Date = Date.AddYears(1); return true; }
                default: { return false; }
            }
        }

        //Только для сортировки
        public static bool operator >(TaskBlock task1, TaskBlock task2)
        {
            //Дата
            if (task1.UseDate && task2.UseDate)
            {
                if (task1.Date > task2.Date) return true;
                else if (task1.Date < task2.Date) return false;
            }
            else if (task1.UseDate) return false;
            else if (task2.UseDate) return true;
            //Срочность
            if (task1.UrgentImportantType != task2.UrgentImportantType)
            {
                byte Count1 = 0, Count2 = 0;
                if (task1.IsUrgent()) Count1++;
                if (task1.IsImportant()) Count1++;
                if (task2.IsUrgent()) Count2++;
                if (task2.IsImportant()) Count2++;
                if (Count1 > Count2) return false;
                else if (Count1 < Count2) return true;
            }
            //Алфавит
            if (task1.Name.CompareTo(task2.Name) > 0) return true;
            else return false;
        }

        public static bool operator <(TaskBlock task1, TaskBlock task2)
        {
            return false;
        }

        public static void Sort(ref List<TaskBlock> list)
        {
            ShellSort(4, ref list);
            ShellSort(2, ref list);
            ShellSort(1, ref list);
        }

        private static void ShellSort(int distance, ref List<TaskBlock> list)
        {
            TaskBlock value;
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