package com.backendless.drinks.data;

import com.backendless.Backendless;
import com.backendless.BackendlessCollection;
import com.backendless.BackendlessUser;
import com.backendless.async.callback.AsyncCallback;
import com.backendless.geo.GeoPoint;
import com.backendless.persistence.BackendlessDataQuery;

public class Order_Components
{
  private java.util.Date updated;
  private Boolean ordered;
  private String ownerId;
  private java.util.Date created;
  private String objectId;
  private Order_Details orderId;
  private String component;
  
  public Order_Components(){
      
  }
  
  public Order_Components(String component, Boolean ordered, Order_Details orderId){
      this.component = component;
      this.ordered = ordered;
      this.orderId = orderId;
  }
  
  public java.util.Date getUpdated()
  {
    return updated;
  }

  public Boolean getOrdered()
  {
    return ordered;
  }

  public void setOrdered( Boolean ordered )
  {
    this.ordered = ordered;
  }

  public String getOwnerId()
  {
    return ownerId;
  }

  public java.util.Date getCreated()
  {
    return created;
  }

  public String getObjectId()
  {
    return objectId;
  }

  public Order_Details getOrderId()
  {
    return orderId;
  }

  public void setOrderId( Order_Details orderId )
  {
    this.orderId = orderId;
  }

                                                    
  public Order_Components save()
  {
    return Backendless.Data.of( Order_Components.class ).save( this );
  }

  public Future<Order_Components> saveAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Order_Components> future = new Future<Order_Components>();
      Backendless.Data.of( Order_Components.class ).save( this, future );

      return future;
    }
  }

  public void saveAsync( AsyncCallback<Order_Components> callback )
  {
    Backendless.Data.of( Order_Components.class ).save( this, callback );
  }

  public Long remove()
  {
    return Backendless.Data.of( Order_Components.class ).remove( this );
  }

  public Future<Long> removeAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Long> future = new Future<Long>();
      Backendless.Data.of( Order_Components.class ).remove( this, future );

      return future;
    }
  }

  public void removeAsync( AsyncCallback<Long> callback )
  {
    Backendless.Data.of( Order_Components.class ).remove( this, callback );
  }

  public static Order_Components findById( String id )
  {
    return Backendless.Data.of( Order_Components.class ).findById( id );
  }

  public static Future<Order_Components> findByIdAsync( String id )
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Order_Components> future = new Future<Order_Components>();
      Backendless.Data.of( Order_Components.class ).findById( id, future );

      return future;
    }
  }

  public static void findByIdAsync( String id, AsyncCallback<Order_Components> callback )
  {
    Backendless.Data.of( Order_Components.class ).findById( id, callback );
  }

  public static Order_Components findFirst()
  {
    return Backendless.Data.of( Order_Components.class ).findFirst();
  }

  public static Future<Order_Components> findFirstAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Order_Components> future = new Future<Order_Components>();
      Backendless.Data.of( Order_Components.class ).findFirst( future );

      return future;
    }
  }

  public static void findFirstAsync( AsyncCallback<Order_Components> callback )
  {
    Backendless.Data.of( Order_Components.class ).findFirst( callback );
  }

  public static Order_Components findLast()
  {
    return Backendless.Data.of( Order_Components.class ).findLast();
  }

  public static Future<Order_Components> findLastAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Order_Components> future = new Future<Order_Components>();
      Backendless.Data.of( Order_Components.class ).findLast( future );

      return future;
    }
  }

  public static void findLastAsync( AsyncCallback<Order_Components> callback )
  {
    Backendless.Data.of( Order_Components.class ).findLast( callback );
  }

  public static BackendlessCollection<Order_Components> find( BackendlessDataQuery query )
  {
    return Backendless.Data.of( Order_Components.class ).find( query );
  }

  public static Future<BackendlessCollection<Order_Components>> findAsync( BackendlessDataQuery query )
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<BackendlessCollection<Order_Components>> future = new Future<BackendlessCollection<Order_Components>>();
      Backendless.Data.of( Order_Components.class ).find( query, future );

      return future;
    }
  }

  public static void findAsync( BackendlessDataQuery query, AsyncCallback<BackendlessCollection<Order_Components>> callback )
  {
    Backendless.Data.of( Order_Components.class ).find( query, callback );
  }

    /**
     * @return the component
     */
    public String getComponent() {
        return component;
    }

    /**
     * @param component the component to set
     */
    public void setComponent(String component) {
        this.component = component;
    }
}