package com.backendless.drinks.data;

import com.backendless.Backendless;
import com.backendless.BackendlessCollection;
import com.backendless.BackendlessUser;
import com.backendless.async.callback.AsyncCallback;
import com.backendless.geo.GeoPoint;
import com.backendless.persistence.BackendlessDataQuery;

public class Bottle {

    private String name;
    private Double bottleCost;
    private Integer mililiters;
    private String alcoholType;
    private String ownerId;
    private java.util.Date created;
    private String objectId;
    private java.util.Date updated;
    
    public Bottle(){}

    public Bottle(String name, Double bottleCost, Integer mililiters, String alcoholType) {
        this.name = name;
        this.bottleCost = bottleCost;
        this.mililiters = mililiters;
        this.alcoholType = alcoholType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getBottleCost() {
        return bottleCost;
    }

    public void setBottleCost(Double bottleCost) {
        this.bottleCost = bottleCost;
    }

    public Integer getMililiters() {
        return mililiters;
    }

    public void setMililiters(Integer mililiters) {
        this.mililiters = mililiters;
    }

    public String getAlcoholType() {
        return alcoholType;
    }

    public void setAlcoholType(String alcoholType) {
        this.alcoholType = alcoholType;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public java.util.Date getCreated() {
        return created;
    }

    public String getObjectId() {
        return objectId;
    }

    public java.util.Date getUpdated() {
        return updated;
    }

    public Bottle save() {
        return Backendless.Data.of(Bottle.class).save(this);
    }

    public Future<Bottle> saveAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Bottle> future = new Future<Bottle>();
            Backendless.Data.of(Bottle.class).save(this, future);

            return future;
        }
    }

    public void saveAsync(AsyncCallback<Bottle> callback) {
        Backendless.Data.of(Bottle.class).save(this, callback);
    }

    public Long remove() {
        return Backendless.Data.of(Bottle.class).remove(this);
    }

    public Future<Long> removeAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Long> future = new Future<Long>();
            Backendless.Data.of(Bottle.class).remove(this, future);

            return future;
        }
    }

    public void removeAsync(AsyncCallback<Long> callback) {
        Backendless.Data.of(Bottle.class).remove(this, callback);
    }

    public static Bottle findById(String id) {
        return Backendless.Data.of(Bottle.class).findById(id);
    }

    public static Future<Bottle> findByIdAsync(String id) {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Bottle> future = new Future<Bottle>();
            Backendless.Data.of(Bottle.class).findById(id, future);

            return future;
        }
    }

    public static void findByIdAsync(String id, AsyncCallback<Bottle> callback) {
        Backendless.Data.of(Bottle.class).findById(id, callback);
    }

    public static Bottle findFirst() {
        return Backendless.Data.of(Bottle.class).findFirst();
    }

    public static Future<Bottle> findFirstAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Bottle> future = new Future<Bottle>();
            Backendless.Data.of(Bottle.class).findFirst(future);

            return future;
        }
    }

    public static void findFirstAsync(AsyncCallback<Bottle> callback) {
        Backendless.Data.of(Bottle.class).findFirst(callback);
    }

    public static Bottle findLast() {
        return Backendless.Data.of(Bottle.class).findLast();
    }

    public static Future<Bottle> findLastAsync() {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<Bottle> future = new Future<Bottle>();
            Backendless.Data.of(Bottle.class).findLast(future);

            return future;
        }
    }

    public static void findLastAsync(AsyncCallback<Bottle> callback) {
        Backendless.Data.of(Bottle.class).findLast(callback);
    }

    public static BackendlessCollection<Bottle> find(BackendlessDataQuery query) {
        return Backendless.Data.of(Bottle.class).find(query);
    }

    public static Future<BackendlessCollection<Bottle>> findAsync(BackendlessDataQuery query) {
        if (Backendless.isAndroid()) {
            throw new UnsupportedOperationException("Using this method is restricted in Android");
        } else {
            Future<BackendlessCollection<Bottle>> future = new Future<BackendlessCollection<Bottle>>();
            Backendless.Data.of(Bottle.class).find(query, future);

            return future;
        }
    }

    public static void findAsync(BackendlessDataQuery query, AsyncCallback<BackendlessCollection<Bottle>> callback) {
        Backendless.Data.of(Bottle.class).find(query, callback);
    }
}
