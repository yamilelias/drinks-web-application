package com.backendless.drinks.data;

import com.backendless.Backendless;
import com.backendless.BackendlessCollection;
import com.backendless.BackendlessUser;
import com.backendless.async.callback.AsyncCallback;
import com.backendless.geo.GeoPoint;
import com.backendless.persistence.BackendlessDataQuery;

public class Recipe_Details
{
  private String ownerId;
  private String description;
  private Double priceMedium;
  private String name;
  private String objectId;
  private Double priceBig;
  private java.util.Date updated;
  private Double priceSmall;
  private java.util.Date created;
  
  public Recipe_Details(){
      
  }
  
  public Recipe_Details(String des,String name,double pb,double pm,double ps){
      description = des;
      this.name = name;
      priceBig = pb;
      priceMedium = pm;
      priceSmall = ps;
  }
  
  
  public String getOwnerId()
  {
    return ownerId;
  }

  public String getDescription()
  {
    return description;
  }

  public void setDescription( String description )
  {
    this.description = description;
  }

  public Double getPriceMedium()
  {
    return priceMedium;
  }

  public void setPriceMedium( Double priceMedium )
  {
    this.priceMedium = priceMedium;
  }

  public String getName()
  {
    return name;
  }

  public void setName( String name )
  {
    this.name = name;
  }

  public String getObjectId()
  {
    return objectId;
  }

  public Double getPriceBig()
  {
    return priceBig;
  }

  public void setPriceBig( Double priceBig )
  {
    this.priceBig = priceBig;
  }

  public java.util.Date getUpdated()
  {
    return updated;
  }

  public Double getPriceSmall()
  {
    return priceSmall;
  }

  public void setPriceSmall( Double priceSmall )
  {
    this.priceSmall = priceSmall;
  }

  public java.util.Date getCreated()
  {
    return created;
  }

                                                    
  public Recipe_Details save()
  {
    return Backendless.Data.of( Recipe_Details.class ).save( this );
  }

  public Future<Recipe_Details> saveAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Details> future = new Future<Recipe_Details>();
      Backendless.Data.of( Recipe_Details.class ).save( this, future );

      return future;
    }
  }

  public void saveAsync( AsyncCallback<Recipe_Details> callback )
  {
    Backendless.Data.of( Recipe_Details.class ).save( this, callback );
  }

  public Long remove()
  {
    return Backendless.Data.of( Recipe_Details.class ).remove( this );
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
      Backendless.Data.of( Recipe_Details.class ).remove( this, future );

      return future;
    }
  }

  public void removeAsync( AsyncCallback<Long> callback )
  {
    Backendless.Data.of( Recipe_Details.class ).remove( this, callback );
  }

  public static Recipe_Details findById( String id )
  {
    return Backendless.Data.of( Recipe_Details.class ).findById( id );
  }

  public static Future<Recipe_Details> findByIdAsync( String id )
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Details> future = new Future<Recipe_Details>();
      Backendless.Data.of( Recipe_Details.class ).findById( id, future );

      return future;
    }
  }

  public static void findByIdAsync( String id, AsyncCallback<Recipe_Details> callback )
  {
    Backendless.Data.of( Recipe_Details.class ).findById( id, callback );
  }

  public static Recipe_Details findFirst()
  {
    return Backendless.Data.of( Recipe_Details.class ).findFirst();
  }

  public static Future<Recipe_Details> findFirstAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Details> future = new Future<Recipe_Details>();
      Backendless.Data.of( Recipe_Details.class ).findFirst( future );

      return future;
    }
  }

  public static void findFirstAsync( AsyncCallback<Recipe_Details> callback )
  {
    Backendless.Data.of( Recipe_Details.class ).findFirst( callback );
  }

  public static Recipe_Details findLast()
  {
    return Backendless.Data.of( Recipe_Details.class ).findLast();
  }

  public static Future<Recipe_Details> findLastAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Details> future = new Future<Recipe_Details>();
      Backendless.Data.of( Recipe_Details.class ).findLast( future );

      return future;
    }
  }

  public static void findLastAsync( AsyncCallback<Recipe_Details> callback )
  {
    Backendless.Data.of( Recipe_Details.class ).findLast( callback );
  }

  public static BackendlessCollection<Recipe_Details> find( BackendlessDataQuery query )
  {
    return Backendless.Data.of( Recipe_Details.class ).find( query );
  }

  public static Future<BackendlessCollection<Recipe_Details>> findAsync( BackendlessDataQuery query )
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<BackendlessCollection<Recipe_Details>> future = new Future<BackendlessCollection<Recipe_Details>>();
      Backendless.Data.of( Recipe_Details.class ).find( query, future );

      return future;
    }
  }

  public static void findAsync( BackendlessDataQuery query, AsyncCallback<BackendlessCollection<Recipe_Details>> callback )
  {
    Backendless.Data.of( Recipe_Details.class ).find( query, callback );
  }
}