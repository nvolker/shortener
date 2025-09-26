defmodule ShortenerWeb.PageController do
  use ShortenerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
