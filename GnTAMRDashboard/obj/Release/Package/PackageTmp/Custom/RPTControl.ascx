<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RPTControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.RPTControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>


<table>
        
            <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="GetReportByPlantIDGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="GetReportByPlantIDDataSource" KeyFieldName="ID"  >
                                                                             <TotalSummary>
                                                                                 <dx:ASPxSummaryItem SummaryType="Sum" FieldName="ManHrs" />
                                                                             </TotalSummary>
                                                                    <Columns>
                                                                   <%--     <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>--%>


                                                                        <dx:GridViewCommandColumn VisibleIndex="0" >  
            <ClearFilterButton Visible="True">  
                 <%--  <Image  Url="Images/image.png" /> --%> 
            </ClearFilterButton>  
</dx:GridViewCommandColumn> 
                                                             


                                                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1"  Caption="Trainig ID" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainingDate" VisibleIndex="2" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn FieldName="TrainingMonth" VisibleIndex="3" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TrainingYear" VisibleIndex="4" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>


                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="5" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainerName" VisibleIndex="6" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="7" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Location" Caption="Location" VisibleIndex="8" ReadOnly="true"></dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn FieldName="TrainingStartTime" Caption="TrainingStartTime" VisibleIndex="9" ReadOnly="true"></dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn FieldName="TrainingEndTime" Caption="TrainingEndTime" VisibleIndex="10" ReadOnly="true"></dx:GridViewDataTextColumn>


                                                                      <%--  <dx:GridViewDataTextColumn FieldName="PlantName" Caption="PlantName" VisibleIndex="9" ReadOnly="true"></dx:GridViewDataTextColumn>--%>

                                                                        <dx:GridViewDataComboBoxColumn FieldName="PlantName" Caption="PlantName" VisibleIndex="11" ReadOnly="true" 
                                                                            PropertiesComboBox-TextField="PlantName" PropertiesComboBox-ValueField="PlantName" PropertiesComboBox-DataSourceID="PlantDataSource">
                                                                            <%--<PropertiesComboBox>
                                                                                <Items>
                                                                                   <dx:ListEditItem Text="08:10:00" Value="08:10:00" />
                                                                                </Items>
                                                                            </PropertiesComboBox>--%>
                                                                        </dx:GridViewDataComboBoxColumn>

                                                                     <%--<dx:GridViewDataTextColumn FieldName="TrainingType" Caption="TrainingType" VisibleIndex="10" ReadOnly="true"></dx:GridViewDataTextColumn>--%>
                                                                        <dx:GridViewDataComboBoxColumn FieldName="TrainingType" Caption="TrainingType" 
                                                                            VisibleIndex="12" ReadOnly="true" PropertiesComboBox-DataSourceID="TrainingDataSource" 
                                                                            PropertiesComboBox-TextField="TrainingType" PropertiesComboBox-ValueField="TrainingType"></dx:GridViewDataComboBoxColumn>


                                                                         <%-- <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="11" ReadOnly="true"></dx:GridViewDataTextColumn>--%>
                                                                         <dx:GridViewDataComboBoxColumn FieldName="Status" Caption="Status" PropertiesComboBox-DataSourceID="StatusDataSource"
                                                                             PropertiesComboBox-TextField="Status" PropertiesComboBox-ValueField="Status"
                                                                             VisibleIndex="13" ReadOnly="true"></dx:GridViewDataComboBoxColumn>




                                                                          <dx:GridViewDataTextColumn FieldName="NoofAttendees" Caption="NoofAttendees" VisibleIndex="14" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                          <dx:GridViewDataTextColumn FieldName="timeDiffInHrs" Caption="timeDiffInHrs" VisibleIndex="15" ReadOnly="true"></dx:GridViewDataTextColumn>

                                                                      <dx:GridViewDataTextColumn FieldName="ManHrs" Caption="Total Man Hours" VisibleIndex="16" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    
                                                                    <%--    
                                                                          <dx:GridViewDataTextColumn FieldName="ManHrs" Caption="Total Man Hours" GroupIndex="2" ShowInCustomizationForm="True" SortIndex="1" SortOrder="Ascending" VisibleIndex="15"> </dx:GridViewDataTextColumn>

                                                                         <dx:GridViewDataTextColumn FieldName="ID" Caption="Trainig ID" GroupIndex="1" ShowInCustomizationForm="True" SortIndex="1" SortOrder="Ascending" VisibleIndex="16"> </dx:GridViewDataTextColumn>--%>
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" ShowTitlePanel="True"/>

                                                                             <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                                                                             <SettingsDetail ShowDetailRow="True" ShowDetailButtons="true" ExportMode="All"/>



                                                                         <Templates>
                                                                             <DetailRow>
                                                                                 <dx:ASPxGridView ID="grdProgressChildGrdRPT" runat="server" AutoGenerateColumns="False" 
                                                                                                     DataSourceID="GetAttendeesByTrainingIDDataSource" KeyFieldName="ID" 
                                                                                     OnBeforePerformDataSelect="grdProgressChildGrdRPT_BeforePerformDataSelect">

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


                                           
                                                  <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GetReportByPlantIDGrd"></dx:ASPxGridViewExporter>



                                                
             <asp:SqlDataSource ID="GetAttendeesByTrainingIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                 OldValuesParameterFormatString="original_{0}"
        SelectCommand ="select a.ID,b.CourseTitle, a.EmployeeeNo,a.EmployeeName,a.Designation,a.Department from Attendees a
inner join TrainingTemplateMaster b on a.TrainingID=b.ID where b.ID=@TRAINING_MASTER_ID_RPT" >
                                                                                      <SelectParameters>
                                                                                        <asp:SessionParameter Name="TRAINING_MASTER_ID_RPT" SessionField="TRAINING_MASTER_ID_RPT" />
                                                                                    </SelectParameters>
                 </asp:SqlDataSource>

                                            </td>
                                        </tr>




    <tr>
        <td>
            <dx:ASPxButton ID="btnReportExport" runat="server" Text="Export" OnClick="btnReportExport_Click"></dx:ASPxButton>
        </td>
    </tr>
    

        <%--    <asp:SqlDataSource ID="GetReportByPlantIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                OldValuesParameterFormatString="original_{0}" 
        SelectCommand ="GetReportByPlantID" SelectCommandType="StoredProcedure" >
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />

                                     </SelectParameters>




            </asp:SqlDataSource>--%>



       <asp:SqlDataSource ID="GetReportByPlantIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                OldValuesParameterFormatString="original_{0}" 
        SelectCommand ="GetReportByPlantIDUserID" SelectCommandType="StoredProcedure" >
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />
                                             <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />
                                     </SelectParameters>




            </asp:SqlDataSource>





<%--            <asp:SqlDataSource ID="dsTrainingStartTime" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                SelectCommand ="TIMELIST" SelectCommandType="StoredProcedure">
                <SelectParameters>
                                        <asp:SessionParameter Name="Stime" DefaultValue="8:00" />
                                            <asp:SessionParameter Name="Etime" DefaultValue="23:00" />
                     <asp:SessionParameter Name="MINInterval" DefaultValue="10" />
                                     </SelectParameters>




</asp:SqlDataSource>--%>



                                       <%-- <asp:SqlDataSource ID="dsTrainingEndTime" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                SelectCommand ="TIMELIST" SelectCommandType="StoredProcedure">
                <SelectParameters>
                                         <asp:SessionParameter Name="Stime" DefaultValue="8:00" />
                                            <asp:SessionParameter Name="Etime" DefaultValue="23:00" />
                     <asp:SessionParameter Name="MINInterval" DefaultValue="10" />
                                     </SelectParameters>
            </asp:SqlDataSource>--%>




                                     <asp:SqlDataSource ID="PlantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="SELECT ID,PlantName FROM Plant where ID In (1,2,3,4,5)"></asp:SqlDataSource>



      <asp:SqlDataSource ID="TrainingDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="SELECT ID,TrainingType FROM TrainingType where isActive=1"></asp:SqlDataSource>


       <asp:SqlDataSource ID="StatusDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select ID,Status from Status where ID In (1,2)"></asp:SqlDataSource>



        </table>