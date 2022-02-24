defmodule ReportsGenerator do
  def build(filename) do
    # Tratamento com case
    case file = File.read("reports/#{filename}") do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
end
