defmodule WedsiteWeb.Router do
  use WedsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WedsiteWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/rsvp", PageController, :code
    get "/rsvp/:invitation", PageController, :form
    get "/complete", PageController, :complete
  end


  scope "/api", WedsiteWeb do
    pipe_through :api

    post "/code", ApiController, :code
    post "/rsvp", ApiController, :rsvp
  end
end
