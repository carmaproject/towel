defmodule Result do
  @moduledoc """
  Documentation for Result.
  """

  @type t(error, value) :: Result.Error.t(error) | Result.Ok.t(value)

  @doc """
  See `Result.Ok.of/1`
  """
  defdelegate ok(value), to: Result.Ok, as: :of

  @doc """
  See `Result.Error.of/1`
  """
  defdelegate error(value), to: Result.Error, as: :of

  @doc """
  See `Result.Operators.from/2`
  """
  defdelegate from(arg1, arg2), to: Result.Operators

  # Operators

  @doc """
  See `Result.Operators.fold/1`
  """
  defdelegate fold(result), to: Result.Operators

  @doc """
  See `Result.Operators.map/2`
  """
  defdelegate map(result, f), to: Result.Operators

  @doc """
  See `Result.Operators.map2/3`
  """
  defdelegate map2(result1, result2, f), to: Result.Operators

  @doc """
  See `Result.Operators.map_error/2`
  """
  defdelegate map_error(result, f), to: Result.Operators

  @doc """
  See `Result.Operators.catch_error/3`
  """
  defdelegate catch_error(result, expected_error, f), to: Result.Operators

  @doc """
  See `Result.Operators.catch_all_errors/2`
  """
  defdelegate catch_all_errors(result, f), to: Result.Operators

  @doc """
  See `Result.Operators.perform/2`
  """
  defdelegate perform(result, f), to: Result.Operators

  @doc """
  See `Result.Operators.and_then/2`
  """
  defdelegate and_then(result, f), to: Result.Operators

  @doc """
  See `Result.Operators.and_then_x/2`
  """
  defdelegate and_then_x(results, f), to: Result.Operators

  @doc """
  See `Result.Operators.with_default/2`
  """
  defdelegate with_default(result, default), to: Result.Operators

  @doc """
  See `Result.Operators.resolve/1`
  """
  defdelegate resolve(result), to: Result.Operators

  @doc """
  See `Result.Operators.retry/4`
  """
  defdelegate retry(result, f, count, timeout \\ 1000), to: Result.Operators

  @doc """
  See `Result.Operators.error?/1`
  """
  defdelegate error?(result), to: Result.Operators

  @doc """
  See `Result.Operators.ok?/1`
  """
  defdelegate ok?(result), to: Result.Operators

  # Calculations

  @doc """
  See `Result.Calc.r_and/2`
  """
  defdelegate r_and(r1, r2), to: Result.Calc

  @doc """
  See `Result.Calc.r_or/2`
  """
  defdelegate r_or(r1, r2), to: Result.Calc

  @doc """
  See `Result.Calc.product/1`
  """
  defdelegate product(list), to: Result.Calc

  @doc """
  See `Result.Calc.sum/1`
  """
  defdelegate sum(list), to: Result.Calc

  def wrap(m = {:ok, _}), do: m
  def wrap(m = {:error, _}), do: m

  def wrap(nil), do: error()
  def wrap(:error), do: error()
  def wrap(v), do: ok(v)

  def unwrap({t, v}) when t in [:ok, :error], do: unwrap(v)
  def unwrap(x), do: x

  def error(), do: {:error, nil}

  def is_ok({:ok, _}), do: true
  def is_ok(_), do: false

  def is_error({:error, _}), do: true
  def is_error(_), do: false
end
