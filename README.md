# Windows-10-Point-of-Sale Template

## Overview

The Windows 10 Point Of Sale Template is a Delphi application built using VCL on Windows. It features a simple point of sale system for operating a cash register. It supports customers, creating a receipt, creating reports, multiple users with permission levels, price mode, and discounts. Additionally, it utilizes powerful VCL styles which provide a modern look and feel and high-DPI monitor support. It is built in such a way as to show the power of VCL in a common use case of a Point of Sale system as a starting point for other developers to use in their own projects.

## Architecture

The template has been built to work both at design time and runtime. At design time everything is hooked up to TFDMemTables which allows you to add a change fields and live bind those fields where they need to go without any extra effort. At runtime the TFDMemTables are converted into TFDTables and stored in an encrypted SQLite database.

The application is built in such a way that the database can easily be switched to the database of your choice. The built-in local database is SQLite but it can easily be changed to use IBTogo or InterBase for a more enterprise multi-user or multi-terminal solution. InterBase is a great choice because of its zero administration featureset. FireDAC supports over 20 different databases and is the database access layer used in the application.

Each tab of the user interface is a separate frame that is embedded on the TPageControl of the TMainForm. Any interface changes should be made directly to the frames themselves and not the embedded frame on the TMainForm. If for whatever reason the frame on the TMainForm gets out of sync with the original frame you can delete the frame from the TMainForm tab and re-add it. Simply drop the frame back on the tab and set it&#39;s align property to alClient.

## Menu Screen

- Login
- Register
- Products
- Reports
- Users

## Login Screen

The login screen features a login and password box and a Login button.

## Register Screen

The register screen features the main functionality of the application. Included on this screen is a register of the current sale, a section to lookup a product based on barcode, stock code, or description, a number pad, and a host of quick functionality buttons.

The current user, current customer, price mode, and current sale total are displayed at the top of the screen.

The tax total and the tax are displayed under the grid of the current sale.

### Functionality

- Pay - Start the pay by cash process. Includes entering the amount received, showing the receipt, and showing the change due back to the customer.
- Product Search - Switches to the product screen for looking up a product.
- Price Change - Changes the price of the selected item in the current sale.
- Discount - Allows adding an item of discount to the current sale.
- Suspend Sale/Recall Sale - Copies the current sale into memory for recall later. Allows recalling the current sale from memory back into the current sale.
- Void Sale - Clears out the current sale.
- Price Mode - Changes the price mode between Normal and Sale. In Sale price mode all products automatically receive a discount to their price when they are added.
- Customer - Allows selecting a customer from the customer database which will be printed on the receipt. By default the customer is set to Anonymous.
- Print Last Slip - Print the receipt from the previous sale.
- Menu - Toggles the left side menu bar.
- Logout - Logs out the current user.

### Register Functionality

- Quantity - Change the quantity of the selected item in the current sale.
- Up - Increase the quantity of the selected item in the current sale by 1.
- Down - Decrease the quantity of the selected item in the current sale by 1.
- Remove - Remove the selected item in the current sale.

## Products Screen

The Products screen allows for creating and editing new products. Products, Categories, Brands, Groups, Variant Attributes, and Units are all editable from the Products screen. A sub screen of the Products screen is the Update Product screen which allows for adding new products and editing existing products.The fields available for each section are as follows.

### Products

- Id
- Description
- Barcode
- Stockcode
- Price
- Misc1
- Misc2
- Misc3
- Category
- Units
- Brand
- Group
- Status
- Image

### Category

- Id
- Title

The category section is a lookup field for the category field on the Products table.

### Brands

- Id
- Title

The brands section is a lookup field for the category field on the Products table.

### Groups

- Id
- Title

The groups section is a lookup field for the category field on the Products table.

### Units

- Id
- Title

The units section is a lookup field for the category field on the Products table.

### Variant Attributes

The variant attributes section features three field names which can be customized and correspond to the three miscellaneous field names of the same name on the Products table. Change these three field names and on the Update Product sub screen they will show up next to those three fields as the field description. The miscellaneous fields could be used for product properties such as color and size.

- Misc1
- Misc2
- Misc3

## Update Product Screen

The Update Product screen allows for editing each field on a product record. The fields are as follows:

- Id - An auto increment field containing the product id.
- Description - The description or name of the product.
- Barcode - The barcode associated with the product.
- Stockcode - The stock code associated with the product.
- Price - The price associate with the product
- Misc1 - Miscellaneous field associated with the Misc1 variant attribute like Size.
- Misc2 - Miscellaneous field associated with the Misc2 variant attribute like Size.
- Misc3 - Miscellaneous field associated with the Misc3 variant attribute.
- Category - The category assigned to the product.
- Units - The unit assigned to the product.
- Brand - The brand assigned to the product.
- Group - The group assigned to the product.
- Status - The status assigned to the product.
- Image - The image assigned to the product.

## Reports Screen

The Reports screen features a place to create product and sales reports. A date range can be selected and then various lookup fields can be used to limit the report by category, brand, and group. The generated report is HTML based.

The generated report is listed in the reports grid and viewed in the Report Form.

The Products report lists sold products by date range, category, brand, and group.

The Sales report lists total sales by date range.

## Users Screen

The Users screen shows all of the users in the system, their permissions, and their current status (either inactive (0) or active (1)). The permission levels include 0 (clerk), 1 (manager), 2 (administrator). The default password for the existing users in the system is: securepass

Users can be created and removed on the users screen and their passwords can also be reset here.

**Note:** The password field in the Users table is hashed and salted with SHA-256. The salt is a unique GUID. The SQLite database itself is also encrypted on the file system.

- Id - Auto incremented user id.
- Name - User name.
- Password - Salted and hashed password.
- Salt - Salt for the password.
- Permissions - User permissions. 0 is clerk, 1 is manager, 2 is administrator.
- Status - User status. 1 is active. 0 is inactive.

Clerks can not access the Reports or Users sections.

Managers can access the Reports and Users sections.

Administrators can access everything. Additional features or permissions could be implemented to differentiate Administrators from Managers.

## VCL Style Selection

The application features two VCL style selection combo boxes at the top right. The first combo box changes the color theme of the top and left side bars of the application. The second combo box changes the body or main frame of the application. Changing these two elements can provide quite a few different look and feels for the application.
