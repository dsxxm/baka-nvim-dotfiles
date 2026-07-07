local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("xml", {
  -- 1. 完整的 mapper 根元素（带 namespace）
  s(
    "mapper",
    fmt(
      [[
        <?xml version="1.0" encoding="UTF-8" ?>
        <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
            "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
        <mapper namespace="{1}">
        {}
        </mapper>
    ]],
      {
        i(1, "com.example.mapper.UserMapper"),
        i(0),
      }
    )
  ),

  -- 2. 通用 select 查询模板
  s(
    "sel",
    fmt(
      [[
        <select id="{1}" resultType="{2}" parameterType="{3}">
            SELECT * FROM {4}
            WHERE 1=1
            {}
        </select>
    ]],
      {
        i(1, "getUser"),
        i(2, "java.lang.String"),
        i(3, "java.lang.Long"),
        i(4, "user_table"),
        i(0),
      }
    )
  ),

  -- 3. insert 语句
  s(
    "ins",
    fmt(
      [[
        <insert id="{1}" parameterType="{2}" useGeneratedKeys="true" keyProperty="{3}">
            INSERT INTO {4} ({5})
            VALUES ({6})
            {}
        </insert>
    ]],
      {
        i(1, "insertUser"),
        i(2, "com.example.entity.User"),
        i(3, "id"),
        i(4, "user_table"),
        i(5, "name, age"),
        i(6, "#{name}, #{age}"),
        i(0),
      }
    )
  ),

  -- 4. update 语句
  s(
    "upd",
    fmt(
      [[
        <update id="{1}" parameterType="{2}">
            UPDATE {3}
            SET {4}
            WHERE id = #{{id}}
            {}
        </update>
    ]],
      {
        i(1, "updateUser"),
        i(2, "com.example.entity.User"),
        i(3, "user_table"),
        i(4, "name = #{name}, age = #{age}"),
        i(0),
      }
    )
  ),

  -- 5. delete 语句
  s(
    "del",
    fmt(
      [[
        <delete id="{1}" parameterType="{2}">
            DELETE FROM {3}
            WHERE id = #{{id}}
            {}
        </delete>
    ]],
      {
        i(1, "deleteUser"),
        i(2, "java.lang.Long"),
        i(3, "user_table"),
        i(0),
      }
    )
  ),

  -- 6. resultMap 模板
  s(
    "rm",
    fmt(
      [[
        <resultMap id="{1}" type="{2}">
            <id property="{3}" column="{4}" />
            <result property="{5}" column="{6}" />
            {}
        </resultMap>
    ]],
      {
        i(1, "UserResultMap"),
        i(2, "com.example.entity.User"),
        i(3, "id"),
        i(4, "user_id"),
        i(5, "name"),
        i(6, "user_name"),
        i(0),
      }
    )
  ),
})
