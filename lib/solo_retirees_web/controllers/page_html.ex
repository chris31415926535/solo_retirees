defmodule SoloRetireesWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use SoloRetireesWeb, :html
use Gettext, backend: SoloRetireesWeb.Gettext
  embed_templates "page_html/*"
end
