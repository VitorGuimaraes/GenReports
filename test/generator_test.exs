defmodule GenReportsTest do
  use ExUnit.Case

  alias GenReports

  describe "build/1" do
    test "build the report if filename is binary" do
      filename = "report_test.csv"
      response = GenReports.build(filename)

      expected_response = %{
        customers_frequency: %{
          "1" => 1,
          "10" => 1,
          "2" => 1,
          "3" => 1,
          "4" => 1,
          "5" => 1,
          "6" => 1,
          "7" => 1,
          "8" => 1,
          "9" => 1
        },
        orders_frequency: %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pizza" => 2
        },
        profit_by_customer: %{
          "1" => 48,
          "10" => 36,
          "2" => 45,
          "3" => 31,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        },
        total_profit: 345
      }

      assert response == expected_response
    end
  end

  test "return an error if filename is not a binary" do
    response = GenReports.build(:not_a_binary)

    expected_response = {:error, "invalid file"}

    assert response == expected_response
  end

  describe "build_many/1" do
    test "return the report if receive a list of binaries" do
      response = GenReports.build_many(["report_1.csv", "report_2.csv", "report_3.csv"])

      expected_response = %{
        customers_frequency: %{
          "1" => 10150,
          "10" => 9855,
          "11" => 9917,
          "12" => 9935,
          "13" => 10265,
          "14" => 10101,
          "15" => 10174,
          "16" => 9909,
          "17" => 9851,
          "18" => 9899,
          "19" => 10039,
          "2" => 9885,
          "20" => 9895,
          "21" => 9994,
          "22" => 10062,
          "23" => 10079,
          "24" => 10015,
          "25" => 9973,
          "26" => 10066,
          "27" => 10077,
          "28" => 10003,
          "29" => 9965,
          "3" => 10043,
          "30" => 10041,
          "4" => 10095,
          "5" => 9864,
          "6" => 9936,
          "7" => 9962,
          "8" => 9997,
          "9" => 9953
        },
        orders_frequency: %{
          "açaí" => 37742,
          "churrasco" => 37650,
          "esfirra" => 37462,
          "hambúrguer" => 37577,
          "pastel" => 37392,
          "pizza" => 37365,
          "prato_feito" => 37519,
          "sushi" => 37293
        },
        profit_by_customer: %{
          "1" => 278_849,
          "10" => 268_317,
          "11" => 268_877,
          "12" => 276_306,
          "13" => 282_953,
          "14" => 277_084,
          "15" => 280_105,
          "16" => 271_831,
          "17" => 272_883,
          "18" => 271_421,
          "19" => 277_720,
          "2" => 271_031,
          "20" => 273_446,
          "21" => 275_026,
          "22" => 278_025,
          "23" => 276_523,
          "24" => 274_481,
          "25" => 274_512,
          "26" => 274_199,
          "27" => 278_001,
          "28" => 274_256,
          "29" => 273_030,
          "3" => 272_250,
          "30" => 275_978,
          "4" => 277_054,
          "5" => 270_926,
          "6" => 272_053,
          "7" => 273_112,
          "8" => 275_161,
          "9" => 274_003
        },
        total_profit: 8_239_413
      }

      assert response == expected_response
    end
  end

  describe "fetch_max/2" do
    test "when the option is :profit_by_customer, returns the most profitable customer, i.e
    the customer who spent more money" do
      response =
        GenReports.build("report_test.csv")
        |> GenReports.fetch_max(:profit_by_customer)

      expected_response = {:ok, {"5", 49}}

      assert response == expected_response
    end

    test "when the option is :orders_frequency, returns the most
    ordered item from the menu" do
      response =
        GenReports.build("report_test.csv")
        |> GenReports.fetch_max(:orders_frequency)

      expected_response = {:ok, {"esfirra", 3}}

      assert response == expected_response
    end

    test "when the option is invalid, returns an error" do
      response =
        GenReports.build("report_test.csv")
        |> GenReports.fetch_max(:anything)

      expected_response = {:error, "invalid option"}

      assert response == expected_response
    end
  end
end

# Elixir in action
# Programming Elixir
# Adopting Elixir: From concept to production
# Learn functional programming with elixir
# Elixir Succinctly
# Introducing Elixir
# Elixir Cookbook
# Elixir programming
# Programming phoenix
# Phoenix in action
# Programming Phoenix LiveView
# Real-Time Phoenix: Build Highly Scalable Systems
# Programming ecto
# Designing elixir systems with OTP
# Functional Web Development with Elixir, Otp, and Phoenix
# Concurrent Data Processing in Elixir
# Metaprogramming elixir
# Build a Weather Station with Elixir and Nerves
# Effective and Robust Testing for Elixir and its Ecosystem
# Craft GraphQL APIs in Elixir with Absinthe
# Designing for Scalability with Erlang/OTP
# Programmer Passport: Elixir
# Programmer Passport: OTP
