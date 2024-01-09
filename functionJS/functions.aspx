<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="functions.aspx.cs" Inherits="functionJS.functions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #form1 {
            max-width: 400px;
            width: 100%;
            padding: 50px;
            box-sizing: border-box;
            background-color: lightgray;
            border-radius: 20px;
        }
    </style>

    <script>
        function add() {
            performOperation('Add');
        }

        function subtract() {
            performOperation('Sub');
        }

        function multiply() {
            performOperation('Multi');
        }

        function divide() {
            performOperation('Divide');
        }

        function performOperation(operation) {
            var num1 = parseFloat(document.getElementById('<%= num1.ClientID %>').value);
            var num2 = parseFloat(document.getElementById('<%= num2.ClientID %>').value);
            var regex = /^\d+(\.\d*)?$/;
            if (!regex.test(num1)) {
                alert('Please enter a valid number.');
                return false;
            }
            else if (!regex.test(num2)) {
                alert('Please enter a valid name.');
                return false;
            }
            var result = 0;

            switch (operation) {
                case 'Add':
                    result = num1 + num2;
                    break;
                case 'Sub':
                    result = num1 - num2;
                    break;
                case 'Multi':
                    result = num1 * num2;
                    break;
                case 'Divide':
                    if (num2 !== 0) {
                        result = num1 / num2;
                    } else {
                        alert('Cannot divide by zero!');
                        return;
                    }
                    break;
                default:
                    alert('No such operation');
                    return;
            }

            document.getElementById('<%= op.ClientID %>').value = result;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="Enter number 1 : "></asp:Label>
                <asp:TextBox ID="num1" runat="server" placeholder="0"></asp:TextBox>
            </div><br />
            <div>
                <asp:Label ID="Label2" runat="server" Text="Enter number 2 : "></asp:Label>
                <asp:TextBox ID="num2" runat="server" placeholder="0"></asp:TextBox>
            </div><br />
            <div>
                <asp:Label ID="Label3" runat="server" Text="Your output : "></asp:Label>
                <asp:TextBox ID="op" runat="server" placeholder="0"></asp:TextBox>
            </div><br />
            <div style="text-align: center;">
                <asp:Button ID="Add" runat="server" Text="Add" ForeColor="White" BackColor="Green" OnClientClick="add(); return false" />
                <asp:Button ID="Sub" runat="server" Text="Subtract" ForeColor="White" BackColor="Green" OnClientClick="subtract(); return false" />
                <asp:Button ID="Multi" runat="server" Text="Multiply" ForeColor="White" BackColor="Green" OnClientClick="multiply(); return false" />
                <asp:Button ID="Divide" runat="server" Text="Divide" ForeColor="White" BackColor="Green" OnClientClick="divide(); return false" />
            </div>
        </div>
    </form>
</body>
</html>