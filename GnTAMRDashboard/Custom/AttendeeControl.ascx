<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttendeeControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.AttendeeControl" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

 <p style="color:red">Please provide mandatory information as required</p>
 <table>
      

                                          <tr>
                                            <td><h5 style="color : #f90">Training ID*</h5></td>
                                             <td class="auto-style1"><asp:DropDownList ID="comboTrainingMaster" runat="server" DataSourceID="TrainingMasterDataSource" 
                                                       AutoPostBack="true" DataTextField="ID" DataValueField="ID" ></asp:DropDownList></td>
                                        </tr>


                                      <tr>
                                            <td><h5 style="color : #f90">Employee No*</h5></td>
                                              <td ><dx:ASPxTextBox ID="txtEmpNo" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>

                                              <td><h5 style="color : #f90">Employee Name*</h5></td>
                                             <td ><dx:ASPxTextBox ID="txtEmpName" runat="server" CssClass="form_textC" ReadOnly="true"></dx:ASPxTextBox> </td>
                                      </tr>


                                       <tr>
                                            <td><h5 style="color : #f90">Designation*</h5></td>
                                              <td ><dx:ASPxTextBox ID="txtEmpDesignation" runat="server" CssClass="form_textC" ReadOnly="true"></dx:ASPxTextBox> </td>

                                              <td><h5 style="color : #f90">Department*</h5></td>
                                             <td ><dx:ASPxTextBox ID="txtEmpDept" runat="server" CssClass="form_textC" ReadOnly="true"></dx:ASPxTextBox> </td>
                                      </tr>


                                            <tr>
                                              <td colspan="4">

                                              </td>
                                          </tr>
  
 
                                           <tr>

                                              <td colspan="2">
                                                  <asp:Button ID="btnValidateAttendee" runat="server" Text="Validate"  CssClass="form_textC" OnClick="btnValidateAttendee_Click" />
                                              </td>


                                               <td colspan="2">
                                                  <asp:Button ID="btnAttendeeSave" runat="server" Text="Save"  CssClass="form_textC" OnClick="btnAttendeeSave_Click"/>
                                              </td>

                                          </tr>



   <%--                                    <asp:SqlDataSource ID="TrainingMasterDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="SELECT a.ID, a.CourseTitle FROM TrainingTemplateMaster a
            inner join Plant b on a.PlantID = b.ID
            inner join TrainingType c on a.TrainingTypeID = c.ID
            inner join Status d on a.TrainingStatus = d.ID
            where  a.PlantID = @PlantID and a.TrainingTypeID =@TrainingTypeID and  a.TrainingStatus=1 order by a.ID">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />
                                     </SelectParameters>
            </asp:SqlDataSource>--%>




      <asp:SqlDataSource ID="TrainingMasterDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="GetPendingTrainingIDS" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />
                                             <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />
                                     </SelectParameters>
            </asp:SqlDataSource>


                                   </table>




<p style="color:red">Selected Training Details</p>

   <table>

                                      <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="SelectedPendingTrainigGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="SelectedPendingTrainingDataSource" KeyFieldName="ID"  >
                                                                    <Columns>

                                                                           <%--  <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>--%>

                                                                           <%-- <dx:GridViewDataTextColumn Caption="Add" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnADDAttendees" runat="server"   CssClass="form_buttonC"  Text="Add"  AutoPostBack="true"  />
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>--%>


                                                                  

                                                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1"  Caption="Trainig ID"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
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
                                                                        <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="12" Visible="false"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Msg" Caption="Msg" VisibleIndex="13"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="TrainingStatus" Caption="TrainingStatus" VisibleIndex="14" Visible="false"></dx:GridViewDataTextColumn>
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             </dx:ASPxGridView>
                                            </td>
                                        </tr>



                                        
                                                                                  <asp:SqlDataSource ID="SelectedPendingTrainingDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="GetSelectedPendingTraining" SelectCommandType="StoredProcedure">

                                                                                      <SelectParameters>
                                         <asp:ControlParameter ControlID="comboTrainingMaster" DefaultValue="0" Name="TID" PropertyName="SelectedValue" />
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />

                                     </SelectParameters>

                                                    
    </asp:SqlDataSource>

   


                                    </table>



 <p style="color:red">Selected Attendees Details</p>

<table>
    <tr>
        <td>
            <dx:ASPxGridView ID="AttendeeGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="GetAttendeesByTrainingIDDataSource" KeyFieldName="ID"  >
                                                                    <Columns>

                                                                      <%--  <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>--%>
                                                                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0"> </dx:GridViewCommandColumn>
 
                                                                    <dx:GridViewDataTextColumn FieldName="ID" Caption="Attendee ID" ReadOnly="True" VisibleIndex="1" Visible="true"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeeNo" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="5"></dx:GridViewDataTextColumn>


<%--                                                                        <dx:GridViewDataTextColumn Caption="FeedBack" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnFeedBack" runat="server"   CssClass="form_buttonC"  Text="view"  AutoPostBack="true"  />
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>--%>


                                                                    
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             </dx:ASPxGridView>



             <asp:SqlDataSource ID="GetAttendeesByTrainingIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                 OldValuesParameterFormatString="original_{0}"
        SelectCommand ="select a.ID,b.CourseTitle, a.EmployeeeNo,a.EmployeeName,a.Designation,a.Department from Attendees a
inner join TrainingTemplateMaster b on a.TrainingID=b.ID where b.ID=@ID" 
                 DeleteCommand="delete from Attendees WHERE (ID =  @original_ID)">
                                                                                      <SelectParameters>
                                                                                        <asp:ControlParameter ControlID="comboTrainingMaster" DefaultValue="0" Name="ID" PropertyName="SelectedValue" />
                                                                                    </SelectParameters>

    <%--     <UpdateParameters>
              <asp:Parameter Name="original_ID" Type="Int64" />
                            <asp:Parameter Name="DemandValue" Type="Int32"/>
                            <asp:Parameter Name="Demand" />
                            <asp:Parameter Name="ActualReading" Type="Int32"/>
                            <asp:Parameter Name="PreviousReading"  Type="Int32"/>
                            <asp:Parameter Name="Reason" />

                            <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" type="Int64" />
                            <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />
        </UpdateParameters>--%>

                 </asp:SqlDataSource>

        </td>
    </tr>
</table>





