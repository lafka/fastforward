<form action={"/content/search/"|ezurl} method="get">
    <div class="block">
        <input type="hidden" name="SearchTextDefaultValue" id="SearchDefaultValue" value="Try searching ?" />
        <input type="text" size="20" name="SearchText" id="Search" value="Try searching ?" />
        <input class="button small" name="SearchButton" type="submit" value="{'Search'|i18n('design/standard/content/search')}" />
    </div>
</form>