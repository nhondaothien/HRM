﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU06_PhepNam.aspx.vb" Inherits="HRM.hrU06_PhepNam" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT PHÉP NĂM
        </div>
        <div class="list-group-item">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>Mã Nhân Viên:</td>
                            <td>
                                <asp:Label ID="lblMaNhanVien" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tên Nhân Viên
                            </td>
                            <td>
                                 <asp:Label ID="lblTenNhanVien" runat="server" Text=""></asp:Label>                                    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click" CausesValidation="False"><i class="fe-plus-square"></i> Thêm Mới</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaPhepNam" AllowPaging="True">
                        <Columns>
                            <asp:ButtonField CommandName="selectRecord" ButtonType="Link" HeaderText="Chọn" Text='<i class="fe-list"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maureu" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaPhepNam" HeaderText="Mã Phép Năm" SortExpression="MaPhepNam" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="NgayXinPhep" HeaderText="Ngày Xin Phép" SortExpression="NgayXinPhep" DataFormatString="{0:MM/dd/yyyy}"/>
                            <asp:BoundField DataField="LyDoNghi" HeaderText="Lý Do Nghỉ" SortExpression="LyDoNghi" />
                            <asp:BoundField DataField="NguoiDuyet" HeaderText="Người Duyệt" SortExpression="NguoiDuyet" />
                            <asp:BoundField DataField="BanGiao" HeaderText="Bàn Giao" SortExpression="BanGiao" />
                            <asp:BoundField DataField="LienLac" HeaderText="Liên Lạc" SortExpression="LienLac" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <%--Start Add--%>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Thêm Mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body margin-top20">
                                <%--[NgayXinPhep], [LyDoNghi], [NguoiDuyet], [MaNhanVien], [BanGiao], [LienLac]--%>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Ngày Xin Phép: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayXinPhep" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayXinPhep_CalendarExtender" TargetControlID="txtNgayXinPhep" ID="txtNgayXinPhep_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Lý Do Nghỉ:</td>
                                        <td>
                                           <asp:TextBox ID="txtLyDoNghi" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Người Duyệt:</td>
                                        <td>
                                           <asp:DropDownList ID="ddlNguoiDuyet" runat="server" DataSourceID="SqlDataSource2" DataTextField="HoTen" DataValueField="HoTen"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bàn Giao:</td>
                                        <td>
                                           <asp:TextBox ID="txtBanGiao" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Liên Lạc:</td>
                                        <td>
                                           <asp:TextBox ID="txtLienLac" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                                             
                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Lưu</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--End Add--%>

        <%--Start Edit--%>
        <div id="editModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Sửa</h4>
                    </div>
                    <div class="modal-body margin-top20">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Mã Phép Năm: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaPhepNam1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Ngày Xin Phép: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayXinPhep1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayXinPhep1_CalendarExtender" TargetControlID="txtNgayXinPhep1" ID="txtNgayXinPhep1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Lý Do Nghỉ:</td>
                                        <td>
                                           <asp:TextBox ID="txtLyDoNghi1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Người Duyệt:</td>
                                        <td>
                                           <asp:DropDownList ID="ddlNguoiDuyet1" runat="server" DataSourceID="SqlDataSource2" DataTextField="HoTen" DataValueField="HoTen"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bàn Giao:</td>
                                        <td>
                                           <asp:TextBox ID="txtBanGiao1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Liên Lạc:</td>
                                        <td>
                                           <asp:TextBox ID="txtLienLac1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                                             
                                </table>
                                <div class="modal-footer">
                        <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Cập nhật</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
                    </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <%--End Edit--%>

        <%--Start Delete--%>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body margin-top20">
                                <table>
                                    <tr>
                                        <td>Bạn có chắc xóa dữ liệu này?
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hfCode" runat="server" />
                            </div>
                            <div class="modal-footer">
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><i class="fe-trash-2"></i> Xóa</asp:LinkButton>
                            <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Hủy</button>
                        </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--End Delete--%>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [hr_PhepNam] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_PhepNam] ([NgayXinPhep], [LyDoNghi], [NguoiDuyet], [MaNhanVien], [BanGiao], [LienLac]) VALUES (@NgayXinPhep, @LyDoNghi, @NguoiDuyet, @MaNhanVien, @BanGiao, @LienLac)"
            UpdateCommand="UPDATE [hr_PhepNam] SET [NgayXinPhep] = @NgayXinPhep, [LyDoNghi] = @LyDoNghi, [NguoiDuyet] = @NguoiDuyet, [MaNhanVien] = @MaNhanVien, [BanGiao] = @BanGiao, [LienLac] = @LienLac WHERE [MaPhepNam] = @MaPhepNam"
            DeleteCommand="DELETE FROM [hr_PhepNam] WHERE [MaPhepNam] = @MaPhepNam">
            <DeleteParameters>
                <asp:Parameter Name="MaPhepNam" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NgayXinPhep" DbType="Date" />
                <asp:Parameter Name="LyDoNghi" Type="String" />
                <asp:Parameter Name="NguoiDuyet" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="BanGiao" Type="String" />
                <asp:Parameter Name="LienLac" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NgayXinPhep" DbType="Date" />
                <asp:Parameter Name="LyDoNghi" Type="String" />
                <asp:Parameter Name="NguoiDuyet" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="BanGiao" Type="String" />
                <asp:Parameter Name="LienLac" Type="String" />
                <asp:Parameter Name="MaPhepNam" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT DISTINCT [HoTen] FROM [vhr_NhanVien]">
        </asp:SqlDataSource>
    </div>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
    <asp:Panel ID="panelError" runat="server" Visible="True">
        <h4 class="alert alert-warning" role="alert">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
    </asp:Panel>
</asp:Content>
