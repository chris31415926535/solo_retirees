defmodule SoloRetirees.PageHitsTest do
  use SoloRetirees.DataCase

  alias SoloRetirees.PageHits

  describe "page_hits" do
    alias SoloRetirees.PageHits.PageHit

    import SoloRetirees.PageHitsFixtures

    @invalid_attrs %{path: nil, ip: nil}

    test "list_page_hits/0 returns all page_hits" do
      page_hit = page_hit_fixture()
      assert PageHits.list_page_hits() == [page_hit]
    end

    test "get_page_hit!/1 returns the page_hit with given id" do
      page_hit = page_hit_fixture()
      assert PageHits.get_page_hit!(page_hit.id) == page_hit
    end

    test "create_page_hit/1 with valid data creates a page_hit" do
      valid_attrs = %{path: "some path", ip: "some ip"}

      assert {:ok, %PageHit{} = page_hit} = PageHits.create_page_hit(valid_attrs)
      assert page_hit.path == "some path"
      assert page_hit.ip == "some ip"
    end

    test "create_page_hit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PageHits.create_page_hit(@invalid_attrs)
    end

    test "update_page_hit/2 with valid data updates the page_hit" do
      page_hit = page_hit_fixture()
      update_attrs = %{path: "some updated path", ip: "some updated ip"}

      assert {:ok, %PageHit{} = page_hit} = PageHits.update_page_hit(page_hit, update_attrs)
      assert page_hit.path == "some updated path"
      assert page_hit.ip == "some updated ip"
    end

    test "update_page_hit/2 with invalid data returns error changeset" do
      page_hit = page_hit_fixture()
      assert {:error, %Ecto.Changeset{}} = PageHits.update_page_hit(page_hit, @invalid_attrs)
      assert page_hit == PageHits.get_page_hit!(page_hit.id)
    end

    test "delete_page_hit/1 deletes the page_hit" do
      page_hit = page_hit_fixture()
      assert {:ok, %PageHit{}} = PageHits.delete_page_hit(page_hit)
      assert_raise Ecto.NoResultsError, fn -> PageHits.get_page_hit!(page_hit.id) end
    end

    test "change_page_hit/1 returns a page_hit changeset" do
      page_hit = page_hit_fixture()
      assert %Ecto.Changeset{} = PageHits.change_page_hit(page_hit)
    end
  end
end
