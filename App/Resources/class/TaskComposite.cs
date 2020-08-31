using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App
{
    class TaskComposite : TaskBlock
    {
        public TaskComposite()
        {
            listTasks = new List<TaskBlock>();
        }

        ~TaskComposite()
        {

        }

        private List<TaskBlock> listTasks;

        public static TaskComposite operator + (TaskComposite taskComposite1, TaskComposite taskComposite2)
        {
            int count1 = taskComposite1.listTasks.Count;
            int count2 = taskComposite2.listTasks.Count;
            if (count1 > count2)
            {
                foreach (TaskBlock item in taskComposite2.listTasks)
                {
                    taskComposite1.listTasks.Add(item);
                }
                return taskComposite1;
            }
            else
            {
                foreach (TaskBlock item in taskComposite1.listTasks)
                {
                    taskComposite2.listTasks.Add(item);
                }
                return taskComposite2;
            }
        }

        public static TaskComposite operator + (TaskComposite taskComposite, TaskPrimitive taskPrimitive)
        {
            taskComposite.listTasks.Add(taskPrimitive);
            return taskComposite;
        }
    }
}