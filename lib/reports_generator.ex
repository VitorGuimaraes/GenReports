defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    # Reads file line by line
    |> File.stream!()
    # Creates a map with the data: %{id, food_name, price}
    |> Enum.reduce(report_acc(), fn line, report_map -> # report_map is the accumulator
      [id, _food_name, price] = parse_line(line) # using pattern matching
      Map.put(report_map, id, report_map[id] + price) # sum order prices of each id
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
