﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="unAuthorize.aspx.cs" Inherits="GnTAMRDashboard.unAuthorize" %>

<!DOCTYPE html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        </style>
</head>
<body>
 <table class="style1" style="border-style: groove">
            <tr>
                <td colspan="4" class="style7">
                    <h1 style="margin: 0px 0px 10px; padding: 0px; font-size: 28px; font-weight: normal; color: rgb(0, 0, 0); font-family: 'Helvetica Neue', HelveticaNeue, Helvetica, Arial, sans-serif; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                        &nbsp;</h1>
                    <h1 style="margin: 0px 0px 10px; padding: 0px; font-size: 28px; font-weight: normal; color: rgb(255, 0, 0); font-family: 'Helvetica Neue', HelveticaNeue, Helvetica, Arial, sans-serif; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                        some thing went wrong</h1>

                <%--    <h1 style="margin: 0px 0px 10px; padding: 0px; font-size: 28px; font-weight: normal; color: rgb(0, 0, 0); font-family: 'Helvetica Neue', HelveticaNeue, Helvetica, Arial, sans-serif; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                       You are not authorize to acess</h1>--%>


    <p class="style1">
        &nbsp;</p>
    </td>
    </tr>


     <tr>
         <td>
             <asp:Label ID="lblUnathorizeAcess" runat="server" Text=""></asp:Label>
          
         </td>
     </tr>

      <tr>
         <td>
             <a href="http://ncm-uat-srv:8031/login.aspx" ><h1 style="margin: 0px 0px 10px; padding: 0px; font-size: 28px; font-weight: normal; color: rgb(255, 0, 0); font-family: 'Helvetica Neue', HelveticaNeue, Helvetica, Arial, sans-serif; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                        Login</h1></a>
         </td>
     </tr>
    </table>
</body>
</html>
