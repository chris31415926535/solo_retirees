defmodule SoloRetirees.SurveysTest do
  use SoloRetirees.DataCase

  alias SoloRetirees.Surveys

  describe "qualitative_responses" do
    alias SoloRetirees.Surveys.Qualitative

    import SoloRetirees.SurveysFixtures

    @invalid_attrs %{age: nil, province: nil, living_situation: nil, freetext: nil}

    test "list_qualitative_responses/0 returns all qualitative_responses" do
      qualitative = qualitative_fixture()
      assert Surveys.list_qualitative_responses() == [qualitative]
    end

    test "get_qualitative!/1 returns the qualitative with given id" do
      qualitative = qualitative_fixture()
      assert Surveys.get_qualitative!(qualitative.id) == qualitative
    end

    test "create_qualitative/1 with valid data creates a qualitative" do
      valid_attrs = %{age: "some age", province: "some province", living_situation: "some living_situation", freetext: "some freetext"}

      assert {:ok, %Qualitative{} = qualitative} = Surveys.create_qualitative(valid_attrs)
      assert qualitative.age == "some age"
      assert qualitative.province == "some province"
      assert qualitative.living_situation == "some living_situation"
      assert qualitative.freetext == "some freetext"
    end

    test "create_qualitative/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Surveys.create_qualitative(@invalid_attrs)
    end

    test "update_qualitative/2 with valid data updates the qualitative" do
      qualitative = qualitative_fixture()
      update_attrs = %{age: "some updated age", province: "some updated province", living_situation: "some updated living_situation", freetext: "some updated freetext"}

      assert {:ok, %Qualitative{} = qualitative} = Surveys.update_qualitative(qualitative, update_attrs)
      assert qualitative.age == "some updated age"
      assert qualitative.province == "some updated province"
      assert qualitative.living_situation == "some updated living_situation"
      assert qualitative.freetext == "some updated freetext"
    end

    test "update_qualitative/2 with invalid data returns error changeset" do
      qualitative = qualitative_fixture()
      assert {:error, %Ecto.Changeset{}} = Surveys.update_qualitative(qualitative, @invalid_attrs)
      assert qualitative == Surveys.get_qualitative!(qualitative.id)
    end

    test "delete_qualitative/1 deletes the qualitative" do
      qualitative = qualitative_fixture()
      assert {:ok, %Qualitative{}} = Surveys.delete_qualitative(qualitative)
      assert_raise Ecto.NoResultsError, fn -> Surveys.get_qualitative!(qualitative.id) end
    end

    test "change_qualitative/1 returns a qualitative changeset" do
      qualitative = qualitative_fixture()
      assert %Ecto.Changeset{} = Surveys.change_qualitative(qualitative)
    end
  end
end
