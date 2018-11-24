<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Loader.ascx.cs" Inherits="RefundManager.UserControls.Loader" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>
<asp:ModalUpdateProgress ID="ModalUpdateProgress1" BackgroundCssClass="modalProgressGreyBackground" runat="server" DisplayAfter="0">
    <progressTemplate>
        <div class="loading-icon">
            <i class="fa fa-cog fa-spin"></i>
        </div>
    </ProgressTemplate>
</asp:ModalUpdateProgress>