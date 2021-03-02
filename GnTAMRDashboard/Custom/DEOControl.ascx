<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DEOControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.DEOControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Custom/AttendeeControl.ascx" TagPrefix="uc1" TagName="AttendeeControl" %>
<%@ Register Src="~/Custom/TrainingEditControl.ascx" TagPrefix="uc1" TagName="TrainingEditControl" %>

<%@ Register Src="~/Custom/RPTControl.ascx" TagPrefix="uc1" TagName="RPTControl" %>








<style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}
    
    .form_textC { border:1px solid #f7941e;
	border-radius:10px;
	height: 30px;
	width: 230px;}

         .form_combo {
         width: 100%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
     }



    .auto-style1 {
        height: 34px;
    }



</style>


<dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="2" runat="server"
                     ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>  
                    <dx:TabPage Text="Create Training">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">



                                 

  <table>





         <tr>
       

          
                <td ><h5 style="color : #f90">Course Date*</h5></td>
                <td ><dx:ASPxDateEdit ID="txtCourseDate" runat="server" CssClass="form_textC"></dx:ASPxDateEdit> </td>
        </tr>


      <tr>
              <td><h5 style="color : #f90">Training Type*</h5></td>
                <td class="auto-style1">
                      <asp:DropDownList ID="comboTrainingType" runat="server" DataSourceID="TrainingTypeDataSource" 
                   AutoPostBack="true" DataTextField="TrainingType" DataValueField="ID" ></asp:DropDownList>

                </td>

         

       


        <td><h5 style="color : #f90">Plant*</h5></td>
          <td class="auto-style1"><asp:DropDownList ID="comboPlant" runat="server" DataSourceID="PlantDataSource" 
                   AutoPostBack="true" DataTextField="PlantName" DataValueField="ID" ></asp:DropDownList></td>
      </tr>



      <tr>
        <td><h5 style="color : #f90">Training Start Time*</h5></td>
          <td >
              
      
              
            <%--  <asp:DropDownList ID="ddlTimeFrom" runat="server" DataSourceID="dsTrainingStartTime" 
                  DataTextField="TIMES" DataValueField="TIMES"  AutoPostBack="true"></asp:DropDownList> --%>


                <asp:DropDownList ID="ddlTimeFrom" runat="server"  >
                    <asp:ListItem Text="08:00:00" Value="08:00:00" />
<asp:ListItem Text="08:10:00" Value="08:10:00" />
<asp:ListItem Text="08:20:00" Value="08:20:00" />
<asp:ListItem Text="08:30:00" Value="08:30:00" />
<asp:ListItem Text="08:40:00" Value="08:40:00" />
<asp:ListItem Text="08:50:00" Value="08:50:00" />
<asp:ListItem Text="09:00:00" Value="09:00:00" />
<asp:ListItem Text="09:10:00" Value="09:10:00" />
<asp:ListItem Text="09:20:00" Value="09:20:00" />
<asp:ListItem Text="09:30:00" Value="09:30:00" />
<asp:ListItem Text="09:40:00" Value="09:40:00" />
<asp:ListItem Text="09:50:00" Value="09:50:00" />
<asp:ListItem Text="10:00:00" Value="10:00:00" />
<asp:ListItem Text="10:10:00" Value="10:10:00" />
<asp:ListItem Text="10:20:00" Value="10:20:00" />
<asp:ListItem Text="10:30:00" Value="10:30:00" />
<asp:ListItem Text="10:40:00" Value="10:40:00" />
<asp:ListItem Text="10:50:00" Value="10:50:00" />
<asp:ListItem Text="11:00:00" Value="11:00:00" />
<asp:ListItem Text="11:10:00" Value="11:10:00" />
<asp:ListItem Text="11:20:00" Value="11:20:00" />
<asp:ListItem Text="11:30:00" Value="11:30:00" />
<asp:ListItem Text="11:40:00" Value="11:40:00" />
<asp:ListItem Text="11:50:00" Value="11:50:00" />
<asp:ListItem Text="12:00:00" Value="12:00:00" />
<asp:ListItem Text="12:10:00" Value="12:10:00" />
<asp:ListItem Text="12:20:00" Value="12:20:00" />
<asp:ListItem Text="12:30:00" Value="12:30:00" />
<asp:ListItem Text="12:40:00" Value="12:40:00" />
<asp:ListItem Text="12:50:00" Value="12:50:00" />
<asp:ListItem Text="13:00:00" Value="13:00:00" />
<asp:ListItem Text="13:10:00" Value="13:10:00" />
<asp:ListItem Text="13:20:00" Value="13:20:00" />
<asp:ListItem Text="13:30:00" Value="13:30:00" />
<asp:ListItem Text="13:40:00" Value="13:40:00" />
<asp:ListItem Text="13:50:00" Value="13:50:00" />
<asp:ListItem Text="14:00:00" Value="14:00:00" />
<asp:ListItem Text="14:10:00" Value="14:10:00" />
<asp:ListItem Text="14:20:00" Value="14:20:00" />
<asp:ListItem Text="14:30:00" Value="14:30:00" />
<asp:ListItem Text="14:40:00" Value="14:40:00" />
<asp:ListItem Text="14:50:00" Value="14:50:00" />
<asp:ListItem Text="15:00:00" Value="15:00:00" />
<asp:ListItem Text="15:10:00" Value="15:10:00" />
<asp:ListItem Text="15:20:00" Value="15:20:00" />
<asp:ListItem Text="15:30:00" Value="15:30:00" />
<asp:ListItem Text="15:40:00" Value="15:40:00" />
<asp:ListItem Text="15:50:00" Value="15:50:00" />
<asp:ListItem Text="16:00:00" Value="16:00:00" />
<asp:ListItem Text="16:10:00" Value="16:10:00" />
<asp:ListItem Text="16:20:00" Value="16:20:00" />
<asp:ListItem Text="16:30:00" Value="16:30:00" />
<asp:ListItem Text="16:40:00" Value="16:40:00" />
<asp:ListItem Text="16:50:00" Value="16:50:00" />
<asp:ListItem Text="17:00:00" Value="17:00:00" />
<asp:ListItem Text="17:10:00" Value="17:10:00" />
<asp:ListItem Text="17:20:00" Value="17:20:00" />
<asp:ListItem Text="17:30:00" Value="17:30:00" />
<asp:ListItem Text="17:40:00" Value="17:40:00" />
<asp:ListItem Text="17:50:00" Value="17:50:00" />
<asp:ListItem Text="18:00:00" Value="18:00:00" />
<asp:ListItem Text="18:10:00" Value="18:10:00" />
<asp:ListItem Text="18:20:00" Value="18:20:00" />
<asp:ListItem Text="18:30:00" Value="18:30:00" />
<asp:ListItem Text="18:40:00" Value="18:40:00" />
<asp:ListItem Text="18:50:00" Value="18:50:00" />
<asp:ListItem Text="19:00:00" Value="19:00:00" />
<asp:ListItem Text="19:10:00" Value="19:10:00" />
<asp:ListItem Text="19:20:00" Value="19:20:00" />
<asp:ListItem Text="19:30:00" Value="19:30:00" />
<asp:ListItem Text="19:40:00" Value="19:40:00" />
<asp:ListItem Text="19:50:00" Value="19:50:00" />
<asp:ListItem Text="20:00:00" Value="20:00:00" />
<asp:ListItem Text="20:10:00" Value="20:10:00" />
<asp:ListItem Text="20:20:00" Value="20:20:00" />
<asp:ListItem Text="20:30:00" Value="20:30:00" />
<asp:ListItem Text="20:40:00" Value="20:40:00" />
<asp:ListItem Text="20:50:00" Value="20:50:00" />
<asp:ListItem Text="21:00:00" Value="21:00:00" />
<asp:ListItem Text="21:10:00" Value="21:10:00" />
<asp:ListItem Text="21:20:00" Value="21:20:00" />
<asp:ListItem Text="21:30:00" Value="21:30:00" />
<asp:ListItem Text="21:40:00" Value="21:40:00" />
<asp:ListItem Text="21:50:00" Value="21:50:00" />
<asp:ListItem Text="22:00:00" Value="22:00:00" />
<asp:ListItem Text="22:10:00" Value="22:10:00" />
<asp:ListItem Text="22:20:00" Value="22:20:00" />
<asp:ListItem Text="22:30:00" Value="22:30:00" />
<asp:ListItem Text="22:40:00" Value="22:40:00" />
<asp:ListItem Text="22:50:00" Value="22:50:00" />
<asp:ListItem Text="23:00:00" Value="23:00:00" />

                </asp:DropDownList> 


          </td>

           <td><h5 style="color : #f90">Training End Time*</h5></td>
         <td >
             
            <%-- <asp:DropDownList ID="ddlTimeTo" runat="server" DataSourceID="dsTrainingEndTime"
              DataTextField="TIMES" DataValueField="TIMES"  AutoPostBack="true"></asp:DropDownList>--%>


              <asp:DropDownList ID="ddlTimeTo" runat="server" >
                  <asp:ListItem Text="08:00:00" Value="08:00:00" />
<asp:ListItem Text="08:10:00" Value="08:10:00" />
<asp:ListItem Text="08:20:00" Value="08:20:00" />
<asp:ListItem Text="08:30:00" Value="08:30:00" />
<asp:ListItem Text="08:40:00" Value="08:40:00" />
<asp:ListItem Text="08:50:00" Value="08:50:00" />
<asp:ListItem Text="09:00:00" Value="09:00:00" />
<asp:ListItem Text="09:10:00" Value="09:10:00" />
<asp:ListItem Text="09:20:00" Value="09:20:00" />
<asp:ListItem Text="09:30:00" Value="09:30:00" />
<asp:ListItem Text="09:40:00" Value="09:40:00" />
<asp:ListItem Text="09:50:00" Value="09:50:00" />
<asp:ListItem Text="10:00:00" Value="10:00:00" />
<asp:ListItem Text="10:10:00" Value="10:10:00" />
<asp:ListItem Text="10:20:00" Value="10:20:00" />
<asp:ListItem Text="10:30:00" Value="10:30:00" />
<asp:ListItem Text="10:40:00" Value="10:40:00" />
<asp:ListItem Text="10:50:00" Value="10:50:00" />
<asp:ListItem Text="11:00:00" Value="11:00:00" />
<asp:ListItem Text="11:10:00" Value="11:10:00" />
<asp:ListItem Text="11:20:00" Value="11:20:00" />
<asp:ListItem Text="11:30:00" Value="11:30:00" />
<asp:ListItem Text="11:40:00" Value="11:40:00" />
<asp:ListItem Text="11:50:00" Value="11:50:00" />
<asp:ListItem Text="12:00:00" Value="12:00:00" />
<asp:ListItem Text="12:10:00" Value="12:10:00" />
<asp:ListItem Text="12:20:00" Value="12:20:00" />
<asp:ListItem Text="12:30:00" Value="12:30:00" />
<asp:ListItem Text="12:40:00" Value="12:40:00" />
<asp:ListItem Text="12:50:00" Value="12:50:00" />
<asp:ListItem Text="13:00:00" Value="13:00:00" />
<asp:ListItem Text="13:10:00" Value="13:10:00" />
<asp:ListItem Text="13:20:00" Value="13:20:00" />
<asp:ListItem Text="13:30:00" Value="13:30:00" />
<asp:ListItem Text="13:40:00" Value="13:40:00" />
<asp:ListItem Text="13:50:00" Value="13:50:00" />
<asp:ListItem Text="14:00:00" Value="14:00:00" />
<asp:ListItem Text="14:10:00" Value="14:10:00" />
<asp:ListItem Text="14:20:00" Value="14:20:00" />
<asp:ListItem Text="14:30:00" Value="14:30:00" />
<asp:ListItem Text="14:40:00" Value="14:40:00" />
<asp:ListItem Text="14:50:00" Value="14:50:00" />
<asp:ListItem Text="15:00:00" Value="15:00:00" />
<asp:ListItem Text="15:10:00" Value="15:10:00" />
<asp:ListItem Text="15:20:00" Value="15:20:00" />
<asp:ListItem Text="15:30:00" Value="15:30:00" />
<asp:ListItem Text="15:40:00" Value="15:40:00" />
<asp:ListItem Text="15:50:00" Value="15:50:00" />
<asp:ListItem Text="16:00:00" Value="16:00:00" />
<asp:ListItem Text="16:10:00" Value="16:10:00" />
<asp:ListItem Text="16:20:00" Value="16:20:00" />
<asp:ListItem Text="16:30:00" Value="16:30:00" />
<asp:ListItem Text="16:40:00" Value="16:40:00" />
<asp:ListItem Text="16:50:00" Value="16:50:00" />
<asp:ListItem Text="17:00:00" Value="17:00:00" />
<asp:ListItem Text="17:10:00" Value="17:10:00" />
<asp:ListItem Text="17:20:00" Value="17:20:00" />
<asp:ListItem Text="17:30:00" Value="17:30:00" />
<asp:ListItem Text="17:40:00" Value="17:40:00" />
<asp:ListItem Text="17:50:00" Value="17:50:00" />
<asp:ListItem Text="18:00:00" Value="18:00:00" />
<asp:ListItem Text="18:10:00" Value="18:10:00" />
<asp:ListItem Text="18:20:00" Value="18:20:00" />
<asp:ListItem Text="18:30:00" Value="18:30:00" />
<asp:ListItem Text="18:40:00" Value="18:40:00" />
<asp:ListItem Text="18:50:00" Value="18:50:00" />
<asp:ListItem Text="19:00:00" Value="19:00:00" />
<asp:ListItem Text="19:10:00" Value="19:10:00" />
<asp:ListItem Text="19:20:00" Value="19:20:00" />
<asp:ListItem Text="19:30:00" Value="19:30:00" />
<asp:ListItem Text="19:40:00" Value="19:40:00" />
<asp:ListItem Text="19:50:00" Value="19:50:00" />
<asp:ListItem Text="20:00:00" Value="20:00:00" />
<asp:ListItem Text="20:10:00" Value="20:10:00" />
<asp:ListItem Text="20:20:00" Value="20:20:00" />
<asp:ListItem Text="20:30:00" Value="20:30:00" />
<asp:ListItem Text="20:40:00" Value="20:40:00" />
<asp:ListItem Text="20:50:00" Value="20:50:00" />
<asp:ListItem Text="21:00:00" Value="21:00:00" />
<asp:ListItem Text="21:10:00" Value="21:10:00" />
<asp:ListItem Text="21:20:00" Value="21:20:00" />
<asp:ListItem Text="21:30:00" Value="21:30:00" />
<asp:ListItem Text="21:40:00" Value="21:40:00" />
<asp:ListItem Text="21:50:00" Value="21:50:00" />
<asp:ListItem Text="22:00:00" Value="22:00:00" />
<asp:ListItem Text="22:10:00" Value="22:10:00" />
<asp:ListItem Text="22:20:00" Value="22:20:00" />
<asp:ListItem Text="22:30:00" Value="22:30:00" />
<asp:ListItem Text="22:40:00" Value="22:40:00" />
<asp:ListItem Text="22:50:00" Value="22:50:00" />
<asp:ListItem Text="23:00:00" Value="23:00:00" />

              </asp:DropDownList>



         </td>


        

         

    </tr>



    <tr>

          <td><h5 style="color : #f90">Trainer Name*</h5></td>
         <td ><dx:ASPxTextBox ID="txtTrainerName" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

        <td><h5 style="color : #f90">Course Title*</h5></td>
         <td ><dx:ASPxTextBox ID="txtCourseName" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

     

    </tr>



 
  


     <tr>
        <td><h5 style="color : #f90">Department*</h5></td>
         <td ><dx:ASPxTextBox ID="txtDepartment" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

          <td><h5 style="color : #f90">Location*</h5></td>
        <td ><dx:ASPxTextBox ID="txtLocation" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

    </tr>
  



      <tr>
          <td colspan="4">

          </td>
      </tr>
  
 
          <tr>
          <td colspan="4">
              <asp:Button ID="btnTrainingSave" runat="server" Text="Save"  CssClass="form_textC" OnClick="btnTrainingSave_Click"/>
          </td>
      </tr>

      



     

               <asp:SqlDataSource ID="TrainingTypeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="GetTrainingTypeForDEO" SelectCommandType="StoredProcedure">
                       <SelectParameters>
                                         <asp:SessionParameter Name="TrainigTypeID" SessionField="thisTrainingTypeID" />
                    
                            <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />
                                     </SelectParameters>

    </asp:SqlDataSource>



    <%--       <asp:SqlDataSource ID="TrainingTypeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="SELECT ID,TrainingType FROM TrainingType where isActive=1 and ID In (@TrainigTypeID)">
                       <SelectParameters>
                                         <asp:SessionParameter Name="TrainigTypeID" SessionField="thisTrainingTypeID" />
                                     </SelectParameters>

    </asp:SqlDataSource>--%>


                                     <asp:SqlDataSource ID="PlantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="GetPlantTypeForDEO" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />
                                     </SelectParameters>

    </asp:SqlDataSource>



   <%--                                <asp:SqlDataSource ID="PlantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="SELECT ID,PlantName FROM Plant where isActive=1 and ID In (@PlantID)">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                     </SelectParameters>

    </asp:SqlDataSource>--%>




      <%-- <asp:SqlDataSource ID="dsTrainingStartTime" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                SelectCommand ="TIMELIST" SelectCommandType="StoredProcedure">
                <SelectParameters>
                                       <asp:SessionParameter Name="Stime" DefaultValue="8:00" />
                                            <asp:SessionParameter Name="Etime" DefaultValue="23:00" />
                     <asp:SessionParameter Name="MINInterval" DefaultValue="10" />
                                     </SelectParameters>




</asp:SqlDataSource>



                                        <asp:SqlDataSource ID="dsTrainingEndTime" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                SelectCommand ="TIMELIST" SelectCommandType="StoredProcedure">
                <SelectParameters>
                                         <asp:SessionParameter Name="Stime" DefaultValue="8:00" />
                                            <asp:SessionParameter Name="Etime" DefaultValue="23:00" />
                     <asp:SessionParameter Name="MINInterval" DefaultValue="10" />
                                     </SelectParameters>
            </asp:SqlDataSource>--%>



     

   
      

         

        </table>


 
                                 

    

             
    <table>
        <tr>
            <td>
                  <uc1:TrainingEditControl runat="server" id="TrainingEditControl" />
            </td>
        </tr>
    </table>





                                



                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>





            <%--         <dx:TabPage Text="Edit Trainings">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                               
                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>--%>

          





                <dx:TabPage Text="Create Training Attendees">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:AttendeeControl runat="server" id="AttendeeControl" />
                             </dx:ContentControl>
                                          
                                 </ContentCollection>
                        </dx:TabPage>

             



               



                <%--   <dx:TabPage Text="Pending Trainigs">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                

                                     <table>

                                      <tr>
                                            <td>

                                              <dx:ASPxGridView ID="PendingTrainigGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="PendingTrainingDataSource" KeyFieldName="ID"  >
                                                                    <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="ID" Caption="Trainig ID"  ReadOnly="True" VisibleIndex="1" Visible="true"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainerName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Location" Caption="TrainingType" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="TrainingDate" Caption="TrainingDate" VisibleIndex="5"></dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn FieldName="TrainingStartTime" Caption="TrainingStartTime" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TrainingEndTime" Caption="TrainingEndTime" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PlantName" Caption="PlantName" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PlantID" Caption="PlantID" VisibleIndex="9" Visible="false"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TrainingType" Caption="TrainingType" VisibleIndex="10"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TrainingTypeID" Caption="TrainingTypeID" VisibleIndex="11" Visible="false"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Status" Caption="Training Status" VisibleIndex="12" Visible="false"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Msg" Caption="Msg" VisibleIndex="13" Visible="false"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TrainingStatus" Caption="TrainingStatus" VisibleIndex="14"></dx:GridViewDataTextColumn>
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             </dx:ASPxGridView>
                                            </td>
                                        </tr>



                                        
                                                                                  <asp:SqlDataSource ID="PendingTrainingDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="GetPendingTrainingDetails" SelectCommandType="StoredProcedure">
                                                                                      <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" type="Int64"/>
                                         <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" type="Int64"/>

                                     </SelectParameters>

                                                    
    </asp:SqlDataSource>

   


                                    </table>


                            </dx:ContentControl>

                                 </ContentCollection>
                       </dx:TabPage>--%>



                 <dx:TabPage Text="Approve Trainings">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                               <%--  <uc1:ApprovalControl runat="server" ID="ApprovalControl" />--%>


                           
 <table>
        
            <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="ApprovalTrainingGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="ApprovalTrainingDataSource" KeyFieldName="ID"  >
                                                                    <Columns>
                                                                   <%--     <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>--%>


                                                                             <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>

                                                                         


                                                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1"  Caption="Trainig ID" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainingDate" VisibleIndex="2" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="3" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainerName" VisibleIndex="4" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="5" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Location" Caption="Location" VisibleIndex="6" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn FieldName="TrainingStartTime" ShowInCustomizationForm="True" Caption="TrainingStartTime" Visible="true" VisibleIndex="7" ReadOnly="true"> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainingEndTime" ShowInCustomizationForm="True" Caption="TrainingEndTime" Visible="true" VisibleIndex="8" ReadOnly="true"> </dx:GridViewDataTextColumn>

                                                                    
                                                                          <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="9"></dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn FieldName="PlantName" Caption="PlantName" VisibleIndex="10"></dx:GridViewDataTextColumn>

                                                                        
                                                                                  <dx:GridViewDataTextColumn Caption="Action" ShowInCustomizationForm="True" VisibleIndex="11">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnFDBModalPopUp" runat="server"   
                                                                                                     CssClass="form_buttonC"  Text="FDB"  AutoPostBack="true"  
                                                                                                     OnClick="btnFDBModalPopUp_Click" OnClientClick="target ='_blank';" Enabled="false"/>
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>

                                                                        



                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                                                                             <SettingsDetail ShowDetailRow="True" ShowDetailButtons="true" ExportMode="All"/>



                                                                         <Templates>
                                                                             <DetailRow>
                                                                                 <dx:ASPxGridView ID="grdProgressChildGrdAPR" runat="server" AutoGenerateColumns="False" 
                                                                                                     DataSourceID="GetAttendeesByTrainingIDDataSource" KeyFieldName="ID" 
                                                                                     OnBeforePerformDataSelect="grdProgressChildGrdAPR_BeforePerformDataSelect">


                                                                                      <TotalSummary>
                                                                                 <dx:ASPxSummaryItem SummaryType="Count" FieldName="EmployeeeNo" />
                                                                             </TotalSummary>

                                                                                                                <Columns>

                                                                                                                         <%--  <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0"> </dx:GridViewCommandColumn>--%>
 
                                                                    <dx:GridViewDataTextColumn FieldName="ID" Caption="Attendee ID" ReadOnly="True" VisibleIndex="1" Visible="true"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeeNo" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="5"></dx:GridViewDataTextColumn>


                                                                                                                </Columns>

                                                                                      <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                                     </dx:ASPxGridView>
                                                                             </DetailRow>
                                                                         </Templates>








                                                                             </dx:ASPxGridView>


                                                
             <asp:SqlDataSource ID="GetAttendeesByTrainingIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                 OldValuesParameterFormatString="original_{0}"
        SelectCommand ="select b.ID,b.CourseTitle, a.EmployeeeNo,a.EmployeeName,a.Designation,a.Department from Attendees a
inner join TrainingTemplateMaster b on a.TrainingID=b.ID where b.ID=@TRAINING_MASTER_ID_APR" >
                                                                                      <SelectParameters>
                                                                                        <asp:SessionParameter Name="TRAINING_MASTER_ID_APR" SessionField="TRAINING_MASTER_ID_APR" />
                                                                                    </SelectParameters>
                 </asp:SqlDataSource>

                                            </td>
                                        </tr>


            <asp:SqlDataSource ID="ApprovalTrainingDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                OldValuesParameterFormatString="original_{0}" 
        SelectCommand ="GetApproveTrainingDetails" SelectCommandType="StoredProcedure" 
                UpdateCommand="update TrainingTemplateMaster 
set CourseTitle=@CourseTitle , TrainerName = @TrainerName,Department=@Department,Location=@Location,
TrainingStartTime=@TrainingStartTime , TrainingEndTime = @TrainingEndTime , 
                timeDiff = dbo.CalculateTimeDiff(@TrainingStartTime, @TrainingEndTime)  WHERE (ID =  @original_ID)">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />
                                              <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />
                                     </SelectParameters>


        <UpdateParameters>
              <asp:Parameter Name="original_ID" Type="Int64" />
            <asp:Parameter Name="DemandValue" Type="Int32"/>
            <asp:Parameter Name="CourseTitle" Type="String"/>
            <asp:Parameter Name="TrainerName" Type="String"/>
            <asp:Parameter Name="Department"  Type="String"/>
            <asp:Parameter Name="Location" Type="String"/>
            <asp:Parameter Name="TrainingStartTime" Type="String"/>
             <asp:Parameter Name="TrainingEndTime" Type="String"/>

    <%--        <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" type="Int64" />
            <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />--%>


        </UpdateParameters>

            </asp:SqlDataSource>

   


    

     </table>


            <%--<dx:ASPxPopupControl ID="FDBModal" Modal="true"   runat="server" CloseAction="CloseButton" LoadContentViaCallback="OnFirstShow"
                          PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" AllowDragging="True" Height="100px" HeaderText="FDB" ClientInstanceName="ClientPopupControl" Width="500px" >
                        <ContentCollection>
                                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                                        <table>
                                            <tr>
                                                <td>
                                                    <uc1:FDBControl runat="server" ID="FDBControl" />
                                                </td>
                                            </tr>
                                        </table>

                                    </dx:PopupControlContentControl>
                            </ContentCollection>
         </dx:ASPxPopupControl>--%>


                             </dx:ContentControl>
                                          


                                 </ContentCollection>
                        </dx:TabPage>




                   <dx:TabPage Text="Report">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:RPTControl runat="server" ID="RPTControl" />
                    </dx:ContentControl>
                         </ContentCollection>
                       </dx:TabPage>




                </TabPages>
            </dx:aspxpagecontrol>




<%-- <table>


                                          <tr>
                                            <td><h5 style="color : #f90">Training ID*</h5></td>
                                             <td class="auto-style1"><asp:DropDownList ID="comboTrainingMaster" runat="server" DataSourceID="TrainingTypeDataSource" 
                                                       AutoPostBack="true" DataTextField="ID" DataValueField="ID" ></asp:DropDownList></td>
                                        </tr>


                                      <tr>
                                            <td><h5 style="color : #f90">Employee No*</h5></td>
                                              <td ><dx:ASPxTextBox ID="txtEmpNo" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

                                              <td><h5 style="color : #f90">Employee Name*</h5></td>
                                             <td ><dx:ASPxTextBox ID="txtEmpName" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>
                                      </tr>


                                       <tr>
                                            <td><h5 style="color : #f90">Designation*</h5></td>
                                              <td ><dx:ASPxTextBox ID="txtEmpDesignation" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

                                              <td><h5 style="color : #f90">Department*</h5></td>
                                             <td ><dx:ASPxTextBox ID="txtEmpDept" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>
                                      </tr>


                                            <tr>
                                              <td colspan="4">

                                              </td>
                                          </tr>
  
 
                                           <tr>
                                              <td colspan="4">
                                                  <asp:Button ID="btnAttendeeSave" runat="server" Text="Save"  CssClass="form_textC"/>
                                              </td>
                                          </tr>



                                       <asp:SqlDataSource ID="TrainingMasterDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="SELECT a.ID TrainingID, A.CourseTitle FROM TrainingTemplateMaster a
            inner join Plant b on a.PlantID = a.ID
            inner join TrainingType c on a.TrainingTypeID = c.ID
            inner join Status d on a.TrainingStatus = d.Status
            where  a.PlantID = @PlantID and a.TrainingTypeID =@TrainingTypeID and  a.TrainingStatus=1">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />
                                     </SelectParameters>
            </asp:SqlDataSource>


                                   </table>--%>