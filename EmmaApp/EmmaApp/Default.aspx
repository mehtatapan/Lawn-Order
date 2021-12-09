<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmaApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Tips from Derek:</h2>
        <p class="lead">You can add your page to the top menu by editing the file "Site.Master". This file is the top menu and bottom footer of each page.</p>
        <p>The home page of each folder is called "Default.aspx". A hyperlink that points to just the folder name will go to the Default page. For example "/Sales" goes to "/Sales/Default.aspx". You can make neat URLs using this behaviour.</p>
        <p><strong>BIG WARNING: ASP.NET Web App uses <u>Bootstrap v3.4.1</u> and <u>jQuery v3.4.1</u></strong>. These are older versions than what we are used to. Upgrading to a later version is not as simple as overwriting the files. Don't try unless you're prepared to break everything.<br />(If you find a workaround to use newer Bootstrap and want to do it, you are very cool 😎)</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Believe in yourself!</h2>
            <p>
                And the power of coffee.
            </p>
        </div>
        <div class="col-md-4">
            <h2>You're almost there!</h2>
            <p>
                There is only a little bit left of this term!
            </p>
        </div>
        <div class="col-md-4">
            <h2>Take care of yourself!</h2>
            <p>
                Don't forget your health and happiness!
            </p>
        </div>
    </div>

</asp:Content>
