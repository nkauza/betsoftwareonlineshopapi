export interface ProductModel {
  productId: number;
  productName: string;
  productImage: string;
  quantity: number;
  productPrice: number;
}

export interface UserModel {
  userId: number;
  userEmail: string;
  userPassword: string;
  userToken: string;
}

export interface OrderModel {
  userId: number | undefined;
  orderItems: OrderItemModel[];
}

export interface OrderItemModel {
  productId: number;
  productName: string;
  productImage: string;
  quantity: number;
  productPrice: number;
}
