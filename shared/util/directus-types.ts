/** * Generated TypeScript types for Directus Schema * Generated on: 2025-06-28T20:01:52.691Z */
export interface PizzasAndDrink {
  id: string;
}

export interface Store {
  id: string;
}

export interface CartItem {
  id: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  pizza: number | Pizza;
  pizzaSize: number | Size;
  uid: string;
  drink: number | Drink;
  productType: string;
  quantity: number;
  pizzaToppings: number[] | CartItemTopping[];
  totalPrice: number;
}

export interface CartItemPizza {
  id: number;
  cartItem_id: number | CartItem;
  pizzas_id: number | Pizza;
}

export interface CartItemTopping {
  id: number;
  cartItem_id: number | CartItem;
  toppings_id: number | Topping;
}

export interface Coupon {
  id: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  code: string;
  discountPercentage: number;
  amountOfUses: number;
  consumeCount: number;
  order: number | Order;
}

export interface Drink {
  id: number;
  sort: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  name: string;
  image: string | DirectusFile;
  price: number;
}

export interface Order {
  id: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  totalInc: number;
  totalExc: number;
  taxPercentage: number;
  discountPercentage: number;
  discountValue: number;
  orderStatus: string;
  cartItems: number[] | OrdersCartItem[];
  subTotal: number;
  taxTotal: number;
}

export interface OrdersCartItem {
  id: number;
  orders_id: number | Order;
  cartItem_id: number | CartItem;
}

export interface Pizza {
  id: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  name: string;
  toppings: number[] | PizzasTopping[];
  image: string | DirectusFile;
  pizzaType: string;
}

export interface PizzasTopping {
  id: number;
  pizzas_id: number | Pizza;
  toppings_id: number | Topping;
}

export interface Settings {
  id: number;
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  taxRateHigh: number;
}

export interface Showcase {
  id: number;
  sort: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  title: string;
  pizzas: number[] | ShowcasePizza[];
}

export interface ShowcasePizza {
  id: number;
  showcase_id: number | Showcase;
  pizzas_id: number | Pizza;
}

export interface Size {
  id: number;
  sort: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  sizeLabel: string;
  sizeDiameter: string;
  /** X = dia(cm) Y = euro,  Y / (π * (X/2)²) */
  priceCm2: number;
}

export interface Topping {
  id: number;
  sort: number;
  user_created: string | DirectusUser;
  date_created: 'datetime';
  user_updated: string | DirectusUser;
  date_updated: 'datetime';
  name: string;
  /** X = dia(cm) Y = euro,  Y / (π * (X/2)²) */
  priceCm2: number;
  priceBase: number;
  /** Allowed formats: SVG, PNG  */
  icon: string | DirectusFile;
  isHidden: boolean;
  /** Icon display size in the configurator */
  displaySize: string;
}

export interface DirectusUser {
  id: string;
  first_name: string;
  last_name: string;
  email: string;
  password: string;
  location: string;
  title: string;
  description: string;
  tags: string;
  avatar: string;
  language: string;
  tfa_secret: boolean;
  status: string;
  role: string;
  token: string;
  last_access: string;
  last_page: string;
  provider: string;
  external_identifier: string;
  auth_data: string;
  email_notifications: boolean;
  appearance: string;
  theme_dark: string;
  theme_light: string;
  theme_light_overrides: string;
  theme_dark_overrides: string;
  policies: string;
}

export interface DirectusFile {
  id: string;
  storage: string;
  filename_disk: string;
  filename_download: string;
  title: string;
  type: string;
  folder: string;
  uploaded_by: string;
  uploaded_on: string;
  modified_by: string;
  modified_on: string;
  charset: string;
  filesize: number;
  width: number;
  height: number;
  duration: number;
  embed: string;
  description: string;
  location: string;
  tags: string;
  metadata: string;
  created_on: string;
  focal_point_x: string;
  focal_point_y: string;
  tus_id: string;
  tus_data: string;
}

export interface DirectusFolder {
  id: string;
  name: string;
  parent: string;
}

export interface DirectusRole {
  id: string;
  name: string;
  icon: string;
  description: string;
  admin_access: boolean;
  app_access: boolean;
  children: string;
  users: string;
  parent: string;
  policies: string;
}

export interface ApiCollections {
  Pizzas_and_drinks: PizzasAndDrink[];
  Store: Store[];
  cartItem: CartItem[];
  cartItem_pizzas: CartItemPizza[];
  cartItem_toppings: CartItemTopping[];
  coupons: Coupon[];
  drinks: Drink[];
  orders: Order[];
  orders_cartItem: OrdersCartItem[];
  pizzas: Pizza[];
  pizzas_toppings: PizzasTopping[];
  settings: Settings;
  showcase: Showcase[];
  showcase_pizzas: ShowcasePizza[];
  sizes: Size[];
  toppings: Topping[];
  directus_users: DirectusUser[];
  directus_files: DirectusFile[];
  directus_folders: DirectusFolder[];
  directus_roles: DirectusRole[];
}

