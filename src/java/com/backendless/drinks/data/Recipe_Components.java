package com.backendless.drinks.data;

import com.backendless.Backendless;
import com.backendless.BackendlessCollection;
import com.backendless.BackendlessUser;
import com.backendless.async.callback.AsyncCallback;
import com.backendless.geo.GeoPoint;
import com.backendless.persistence.BackendlessDataQuery;

public class Recipe_Components
{
  private Integer parts;
  private java.util.Date updated;
  private String ownerId;
  private String objectId;
  private String alcoholType;
  private java.util.Date created;
  private Recipe_Details recipeId;
  public Integer getParts()
  {
    return parts;
  }

  public void setParts( Integer parts )
  {
    this.parts = parts;
  }

  public java.util.Date getUpdated()
  {
    return updated;
  }

  public String getOwnerId()
  {
    return ownerId;
  }

  public String getObjectId()
  {
    return objectId;
  }

  public String getAlcoholType()
  {
    return alcoholType;
  }

  public void setAlcoholType( String alcoholType )
  {
    this.alcoholType = alcoholType;
  }

  public java.util.Date getCreated()
  {
    return created;
  }

  public Recipe_Details getRecipeId()
  {
    return recipeId;
  }

  public void setRecipeId( Recipe_Details recipeId )
  {
    this.recipeId = recipeId;
  }

                                                    
  public Recipe_Components save()
  {
    return Backendless.Data.of( Recipe_Components.class ).save( this );
  }

  public Future<Recipe_Components> saveAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Components> future = new Future<Recipe_Components>();
      Backendless.Data.of( Recipe_Components.class ).save( this, future );

      return future;
    }
  }

  public void saveAsync( AsyncCallback<Recipe_Components> callback )
  {
    Backendless.Data.of( Recipe_Components.class ).save( this, callback );
  }

  public Long remove()
  {
    return Backendless.Data.of( Recipe_Components.class ).remove( this );
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
      Backendless.Data.of( Recipe_Components.class ).remove( this, future );

      return future;
    }
  }

  public void removeAsync( AsyncCallback<Long> callback )
  {
    Backendless.Data.of( Recipe_Components.class ).remove( this, callback );
  }

  public static Recipe_Components findById( String id )
  {
    return Backendless.Data.of( Recipe_Components.class ).findById( id );
  }

  public static Future<Recipe_Components> findByIdAsync( String id )
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Components> future = new Future<Recipe_Components>();
      Backendless.Data.of( Recipe_Components.class ).findById( id, future );

      return future;
    }
  }

  public static void findByIdAsync( String id, AsyncCallback<Recipe_Components> callback )
  {
    Backendless.Data.of( Recipe_Components.class ).findById( id, callback );
  }

  public static Recipe_Components findFirst()
  {
    return Backendless.Data.of( Recipe_Components.class ).findFirst();
  }

  public static Future<Recipe_Components> findFirstAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Components> future = new Future<Recipe_Components>();
      Backendless.Data.of( Recipe_Components.class ).findFirst( future );

      return future;
    }
  }

  public static void findFirstAsync( AsyncCallback<Recipe_Components> callback )
  {
    Backendless.Data.of( Recipe_Components.class ).findFirst( callback );
  }

  public static Recipe_Components findLast()
  {
    return Backendless.Data.of( Recipe_Components.class ).findLast();
  }

  public static Future<Recipe_Components> findLastAsync()
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<Recipe_Components> future = new Future<Recipe_Components>();
      Backendless.Data.of( Recipe_Components.class ).findLast( future );

      return future;
    }
  }

  public static void findLastAsync( AsyncCallback<Recipe_Components> callback )
  {
    Backendless.Data.of( Recipe_Components.class ).findLast( callback );
  }

  public static BackendlessCollection<Recipe_Components> find( BackendlessDataQuery query )
  {
    return Backendless.Data.of( Recipe_Components.class ).find( query );
  }

  public static Future<BackendlessCollection<Recipe_Components>> findAsync( BackendlessDataQuery query )
  {
    if( Backendless.isAndroid() )
    {
      throw new UnsupportedOperationException( "Using this method is restricted in Android" );
    }
    else
    {
      Future<BackendlessCollection<Recipe_Components>> future = new Future<BackendlessCollection<Recipe_Components>>();
      Backendless.Data.of( Recipe_Components.class ).find( query, future );

      return future;
    }
  }

  public static void findAsync( BackendlessDataQuery query, AsyncCallback<BackendlessCollection<Recipe_Components>> callback )
  {
    Backendless.Data.of( Recipe_Components.class ).find( query, callback );
  }
}