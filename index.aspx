﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.signalR-1.0.1.min.js" type="text/javascript"></script>
    <script src="signalr/hubs" type="text/javascript"></script>

    <script type="text/javascript">

        $(function () {
            // Proxy created on the fly          
            var chat = $.connection.chatHub;
            // Get the user name and store it to prepend to messages.
            $('#displayname').val(prompt('Enter your name:', ''));
            ShowHideDiv();

            var buttonhit = "";



            // Declare a function on the chat hub so the server can invoke it          
            chat.client.sendMessage = function (name, message, message1, title, messageChat) {
                var encodedName = name;
                var encodedMsg = message;
                var encodedMsg1 = message1;
                var encodedtitle = title;
                var encodemessageChat = messageChat;
            
                var nullmsg = '';
                $('#lblname').text(encodedName);
                $('#txtMessages').val(encodedMsg);
                $('#txtMessages1').val(encodedMsg1);
                $('#lbltitle').val(encodedtitle);
                $('#lbltitlehead').text(encodedtitle);
                $('#lblMessages1').text(encodedMsg1);
    alert(encodedMsgChat);

                // var encodedMsgChat = $('<div />').text(messageChat).html();
                $('#txtMessagesChat').append(encodedName + ':&nbsp;&nbsp;' + encodedMsgChat);
                alert(encodedMsgChat);
            };


            //            if (buttonhit == "2") {

            //                // Declare a function on the chat hub so the server can invoke it          
            //                chat.client.sendMessage = function (nameChat, messageChat) {
            //                    var encodedNameChat = $('<div />').text(nameChat).html();
            //                    var encodedMsgChat = $('<div />').text(messageChat).html();
            //                    $('#txtMessagesChat').append(encodedNameChat + ':&nbsp;&nbsp;' + encodedMsgChat + '<br />');
            //                };
            //            }







            //--------***************************************-----------************************************



            // Start the connection
            $.connection.hub.start().done(function () {
                $("#Sendtitle").click(function () {

                    // Call the chat method on the server
                    chat.server.send($('#displayname').val(), $('#msg').val(), $('#txtMessages1').val(), $('#lbltitle').val());

                });

                $("#sendChat").click(function () {


                    // Call the chat method on the server
                    // chat.server.sendChat($('#displayname').val(), $('#msgChat').val());
                    chat.server.send($('#displayname').val(), $('#msg').val(), $('#txtMessages1').val(), $('#lbltitle').val(), $('#msgChat').val());


                    //alert($('#msgChat').val());

                });



            });
        });

        //-----------------------Amount in Numeric
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        //---------------------- Timer-----------------------
        // Set the date we're counting down to
        var countDownDate = new Date("Sep 11, 2018 18:37:25").getTime();

        // Update the count down every 1 second
        var x = setInterval(function () {

            // Get todays date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Output the result in an element with id="demo"
            document.getElementById("demo").innerHTML = hours + "h " + minutes + "m " + seconds + "s ";

            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("demo").innerHTML = "EXPIRED";
                var btnSend = document.getElementById("send");
                btnSend.style.visibility = false;

            }
        }, 1000);

    </script>
    <script type="text/javascript">
        function ShowHideDiv() {

            var dispname = $('#displayname').val();

            if (dispname == "admin") {

                var divhide = document.getElementsByClassName("divhid");
                divhide[0].style.display = "block";
                divhide[1].style.display = "block";
            }
            else {

                var divhide = document.getElementsByClassName("divhid");
                divhide[0].style.display = "none";
                divhide[1].style.display = "none";
            }
        }
    </script>
    <style type="text/css">
        #msg
        {
            width: 121px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>
            <strong>
                <asp:Label ID="lbltitlehead" runat="server" Text=""></asp:Label></strong></h2>
        <table width="100%">
            <tr>
                <td style="width: 10%">
                    <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                    &nbsp;
                </td>
                <td>
                    <input type="text" id="txtMessages" placeholder="Tender Amount" onkeypress="return isNumber(event)" />
                </td>
                <td style="width: 60%; text-align: right">
                    Time Remaning :
                </td>
            </tr>
            <tr>
                <td>
                    Unit/Currency :
                </td>
                <td>
                    <asp:Label ID="lblMessages1" runat="server" Text=""></asp:Label>
                    <div class="divhid">
                        <input type="text" id="txtMessages1" placeholder="(INR) in Rupee " /></div>
                </td>
                <td style="width: 60%; text-align: right">
                    <p id="demo">
                    </p>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <table width="100%">
            <tr>
                <td style="width: 10%" colspan="4">
                    <div class="divhid">
                        Title:<br />
                        <input type="text" id="lbltitle" style="width: 250px" /></div>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Amount :<br />
                    <input type="text" id="msg" placeholder="Tender Amount" onkeypress="return isNumber(event)" />
                </td>
                <td>
                    <br />
                    <input type="button" id="Sendtitle" value="Send title" />
                </td>
                <td>
                    <input type="button" id="send" value="Send" style="display: none" />
                </td>
                <td>
                    <input type="hidden" id="displayname" />
                </td>
            </tr>
        </table>
        <p>
         <textarea id="txtMessagesChat" style ="width: 257px; height: 286px;"></textarea>        <br />
         <input type="text" id="msgChat" style ="width: 200px;"/>
        <input type="button" id="sendChat" value="Send" />
        <input type="hidden" id="displaynameChat" />
        </p>
    </div>
    </form>
 
</body>
</html>
