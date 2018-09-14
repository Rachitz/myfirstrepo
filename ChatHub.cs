using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace RealTime_Data
{
    public class ChatHub : Hub
    {
        public void Send(string title)
        {
            Clients.All.sendMessage(title);
        }

       

        public void Send(string name, string message, string message1, string title, string messageChat)
        {
            Clients.All.sendMessage(name, message, message1, title, messageChat);
        }

    }
}