package com.backendless.drinks.data;

import com.backendless.Backendless;
import com.backendless.BackendlessCollection;
import com.backendless.BackendlessUser;
import com.backendless.async.callback.AsyncCallback;
import com.backendless.geo.GeoPoint;
import com.backendless.persistence.BackendlessDataQuery;
import java.util.*;
import java.text.SimpleDateFormat;

public class Order_Details {

    private java.util.Date orderDate;
    private Double sellingPrice;
    private java.util.Date created;
    private String objectId;
    private String size;
    private Double productCost;
    private java.util.Date updated;
    private String ownerId;
    private BackendlessUser userId;
    private Recipe_Details recipeId;

    public Order_Details() {

    }

    public Order_Details(double sp, String size) {
        orderDate = Calendar.getInstance().getTime();
        sellingPrice = sp;
        this.size = size;
    }

    public java.util.Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(java.util.Date orderDate) {
        this.orderDate = orderDate;
    }

    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public java.util.Date getCreated() {
        return created;
    }

    public String getObjectId() {
        return objectId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Double getProductCost() {
        return productCost;
    }

    public void setProductCost(Double productCost) {
        this.productCost = productCost;
    }

    public java.util.Date getUpdated() {
        return updated;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public BackendlessUser getUserId() {
        return userId;
    }

    public void setUserId(BackendlessUser userId) {
        this.userId = userId;
    }

    public Recipe_Details getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(Recipe_Details recipeId) {
        this.recipeId = recipeId;
    }

    public Order_Details save() {
        return Backendless.Data.of(Order_Details.class).save(this);
    }

    public Future<Order_Details> saveAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Order_Details> future = new Future<Order_Details>();
            Backendless.Data.of(Order_Details.class).save(this, future);

            return future;
        }
    }

    public void saveAsync(AsyncCallback<Order_Details> callback) {
        Backendless.Data.of(Order_Details.class).save(this, callback);
    }

    public Long remove() {
        return Backendless.Data.of(Order_Details.class).remove(this);
    }

    public Future<Long> removeAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Long> future = new Future<Long>();
            Backendless.Data.of(Order_Details.class).remove(this, future);

            return future;
        }
    }

    public void removeAsync(AsyncCallback<Long> callback) {
        Backendless.Data.of(Order_Details.class).remove(this, callback);
    }

    public static Order_Details findById(String id) {
        return Backendless.Data.of(Order_Details.class).findById(id);
    }

    public static Future<Order_Details> findByIdAsync(String id) {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Order_Details> future = new Future<Order_Details>();
            Backendless.Data.of(Order_Details.class).findById(id, future);

            return future;
        }
    }

    public static void findByIdAsync(String id, AsyncCallback<Order_Details> callback) {
        Backendless.Data.of(Order_Details.class).findById(id, callback);
    }

    public static Order_Details findFirst() {
        return Backendless.Data.of(Order_Details.class).findFirst();
    }

    public static Future<Order_Details> findFirstAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Order_Details> future = new Future<Order_Details>();
            Backendless.Data.of(Order_Details.class).findFirst(future);

            return future;
        }
    }

    public static void findFirstAsync(AsyncCallback<Order_Details> callback) {
        Backendless.Data.of(Order_Details.class).findFirst(callback);
    }

    public static Order_Details findLast() {
        return Backendless.Data.of(Order_Details.class).findLast();
    }

    public static Future<Order_Details> findLastAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Order_Details> future = new Future<Order_Details>();
            Backendless.Data.of(Order_Details.class).findLast(future);

            return future;
        }
    }

    public static void findLastAsync(AsyncCallback<Order_Details> callback) {
        Backendless.Data.of(Order_Details.class).findLast(callback);
    }

    public static BackendlessCollection<Order_Details> find(BackendlessDataQuery query) {
        return Backendless.Data.of(Order_Details.class).find(query);
    }

    public static Future<BackendlessCollection<Order_Details>> findAsync(BackendlessDataQuery query) {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<BackendlessCollection<Order_Details>> future = new Future<BackendlessCollection<Order_Details>>();
            Backendless.Data.of(Order_Details.class).find(query, future);

            return future;
        }
    }

    public static void findAsync(BackendlessDataQuery query, AsyncCallback<BackendlessCollection<Order_Details>> callback) {
        Backendless.Data.of(Order_Details.class).find(query, callback);
    }
}
