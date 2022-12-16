class EndPoints {
  static const productionBaseUrl = "";
  static const stagingBaseUrl = "https://zinvoiceapi3.azurewebsites.net/api/";

  static const base = 'https://zinvoiceapi3.azurewebsites.net/api/';

  // auth
  static const login = 'Authenticate/login';


  //invoices
  static const getInvoices = 'Invoices';

  //customers
  static const getCustomers = 'Customers';
  static const getCustomersLookups = 'Customers/getCustomer-lookups';

  //products
  static const getProducts = 'Items';
  static const addProduct = 'Items';
  static const getItemTypes = 'Items/getItem-lookups';

  //profile
  static const getProfile = 'Users/getuserdata';
  static const changePassword = 'Users/change-password';


}
