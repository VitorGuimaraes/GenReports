defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    # Reads file line by line
    |> File.stream!()
    # Creates a map with the data: %{id, food_name, price}
    |> Enum.reduce(%{}, fn line, report_map -> # report_map is the accumulator
      [id, _food_name, price] = parse_line(line) # using pattern matching
      Map.put(report_map, id, price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
