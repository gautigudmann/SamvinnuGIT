// Sindri Snær

pageextension 50104 MyNewBCHeadline extends "Headline RC Business Manager"
{
    layout
    {
        addafter(Control14)
        {
            field(newHeadlineText; newHeadlineText)
            {
                ApplicationArea = all;
                trigger OnDrillDown()
                var
                    Customer: Record Customer;
                    CustomerList: Page "Customer List";
                begin
                    //Show the customer without category assigned
                    Customer.SetRange("Customer Category", '');
                    CustomerList.SetTableView(Customer);
                    CustomerList.Run();
                end;
            }
        }
    }

    var
        newHeadlineText: Text;

    Trigger OnOpenPage()
    var
        HeadlineMgt: CodeUnit "Headline Management";
        CustomerManagement: Codeunit "Customer Management";
    begin
        //Set HEadline text
        newHeadlineText := 'Number of Customers without assigned Category:
        '+
        Headlinemgt.Empasize(Format(CustomerManagement.GetTotalCustomersWithoutCategory()));
    end;
}